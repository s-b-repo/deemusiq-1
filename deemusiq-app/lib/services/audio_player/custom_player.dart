import 'dart:async';
import 'package:deemusiq/services/logger/logger.dart';
import 'package:media_kit/media_kit.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:audio_session/audio_session.dart';
// ignore: implementation_imports
import 'package:deemusiq/services/audio_player/playback_state.dart';
import 'package:deemusiq/utils/platform.dart';

/// MediaKit [Player] by default doesn't have a state stream.
/// This class adds a state stream to the [Player] class.
class CustomPlayer extends Player {
  final StreamController<AudioPlaybackState> _playerStateStream;

  late final List<StreamSubscription> _subscriptions;

  int _androidAudioSessionId = 0;
  String _packageName = "";
  AndroidAudioManager? _androidAudioManager;

  CustomPlayer({super.configuration})
      : _playerStateStream = StreamController.broadcast() {
    nativePlayer.setProperty("network-timeout", "120");

    _subscriptions = [
      stream.buffering.listen((event) {
        _playerStateStream.add(AudioPlaybackState.buffering);
      }),
      stream.playing.listen((playing) {
        if (playing) {
          _playerStateStream.add(AudioPlaybackState.playing);
        } else {
          _playerStateStream.add(AudioPlaybackState.paused);
        }
      }),
      stream.completed.listen((isCompleted) async {
        if (!isCompleted) return;
        _playerStateStream.add(AudioPlaybackState.completed);
      }),
      stream.playlist.listen((event) {
        if (event.medias.isEmpty) {
          _playerStateStream.add(AudioPlaybackState.stopped);
        }
      }),
      stream.error.listen((event) {
        AppLogger.reportError('[MediaKitError] \n$event', StackTrace.current);
      }),
    ];
    PackageInfo.fromPlatform().then((packageInfo) {
      _packageName = packageInfo.packageName;
    });
    if (kIsAndroid) {
      _androidAudioManager = AndroidAudioManager();
      AudioSession.instance.then((s) async {
        _androidAudioSessionId =
            await _androidAudioManager!.generateAudioSessionId();
        notifyAudioSessionUpdate(true);

        await nativePlayer.setProperty(
          "audiotrack-session-id",
          _androidAudioSessionId.toString(),
        );
        await nativePlayer.setProperty("ao", "audiotrack,opensles,");
      });
    }
  }

  Future<void> notifyAudioSessionUpdate(bool active) async {
    if (kIsAndroid) {
      sendBroadcast(
        BroadcastMessage(
          name: active
              ? "android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION"
              : "android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION",
          data: {
            "android.media.extra.AUDIO_SESSION": _androidAudioSessionId,
            "android.media.extra.PACKAGE_NAME": _packageName
          },
        ),
      );
    }
  }

  bool get shuffled => state.shuffle;

  Stream<AudioPlaybackState> get playerStateStream => _playerStateStream.stream;
  Stream<bool> get shuffleStream => stream.shuffle;
  Stream<int> get indexChangeStream {
    int oldIndex = state.playlist.index;
    return stream.playlist.map((event) => event.index).where((newIndex) {
      if (newIndex != oldIndex) {
        oldIndex = newIndex;
        return true;
      }
      return false;
    });
  }

  @override
  Future<void> setShuffle(bool shuffle) async {
    await super.setShuffle(shuffle);
  }

  @override
  Future<void> stop() async {
    await super.stop();

    _playerStateStream.add(AudioPlaybackState.stopped);
  }

  @override
  Future<void> dispose() async {
    for (var element in _subscriptions) {
      element.cancel();
    }
    await notifyAudioSessionUpdate(false);
    return super.dispose();
  }

  NativePlayer get nativePlayer => platform as NativePlayer;

  Future<void> insert(int index, Media media) async {
    final addedMediaCompleter = Completer<int>();
    final playlistStream = stream.playlist.listen(
      (event) {
        final mediaAddedIndex =
            event.medias.indexWhere((m) => m.uri == media.uri);
        if (mediaAddedIndex != -1 && !addedMediaCompleter.isCompleted) {
          addedMediaCompleter.complete(mediaAddedIndex);
        }
      },
    );
    try {
      await add(media);
      final mediaAddedIndex = await addedMediaCompleter.future;
      await move(mediaAddedIndex, index);
    } finally {
      playlistStream.cancel();
    }
  }

  Future<void> setAudioNormalization(bool normalize) async {
    if (normalize) {
      await nativePlayer.setProperty('af', 'dynaudnorm=g=5:f=250:r=0.9:p=0.5');
    } else {
      await nativePlayer.setProperty('af', '');
    }
  }

  Future<void> setDemuxerBufferSize(int sizeInBytes) async {
    await nativePlayer.setProperty('demuxer-max-bytes', sizeInBytes.toString());
    await nativePlayer.setProperty(
      'demuxer-max-back-bytes',
      sizeInBytes.toString(),
    );
  }

  // ── Spotify-style crossfade ──────────────────────────────────────────────

  /// Sets the crossfade duration between tracks. 0 = off (default).
  /// mpv handles this via `audio-fade-in` on the next track — gapless
  /// playback is always enabled (mpv default).
  Future<void> setCrossfade(Duration duration) async {
    if (duration.inSeconds <= 0) {
      await nativePlayer.setProperty('audio-fade-in', '0');
    } else {
      await nativePlayer.setProperty(
        'audio-fade-in',
        duration.inSeconds.toString(),
      );
    }
  }

  /// Enables gapless playback (mpv default, no gaps between tracks).
  /// Explicitly sets the relevant mpv properties.
  Future<void> setGaplessPlayback(bool enabled) async {
    await nativePlayer.setProperty('gapless-audio', enabled ? 'yes' : 'no');
    // Prefetch the next track's audio data for seamless transitions.
    await nativePlayer.setProperty('prefetch-playlist', enabled ? 'yes' : 'no');
  }

  /// Sets audio replaygain mode. 'track' = per-track, 'album' = per-album,
  /// 'off' = disabled. Matches Spotify's volume normalization.
  Future<void> setReplayGain(String mode) async {
    switch (mode) {
      case 'track':
        await nativePlayer.setProperty('replaygain', 'track');
        break;
      case 'album':
        await nativePlayer.setProperty('replaygain', 'album');
        break;
      default:
        await nativePlayer.setProperty('replaygain', 'no');
    }
  }

  /// Seeks to the previous track. Wraps around if loop mode is on and we're
  /// at the start of the playlist.
  @override
  Future<void> previous() async {
    // If we're more than 3 seconds into the current track, restart it.
    // Otherwise, go to the previous track (Spotify behaviour).
    if (state.position.inSeconds > 3) {
      await seek(const Duration(seconds: 0));
    } else {
      await super.previous();
    }
  }
}
