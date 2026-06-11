import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/components/dialogs/select_device_dialog.dart';
import 'package:deemusiq/components/track_presentation/presentation_actions.dart';
import 'package:deemusiq/components/track_presentation/presentation_props.dart';

import 'package:deemusiq/models/connect/connect.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/audio_player/audio_player.dart';
import 'package:deemusiq/provider/connect/connect.dart';
import 'package:deemusiq/provider/history/history.dart';
import 'package:deemusiq/services/audio_player/audio_player.dart';
import 'package:deemusiq/services/logger/logger.dart';

typedef UseActionCallbacks = ({
  bool isActive,
  bool isLoading,
  Future<void> Function() onShuffle,
  Future<void> Function() onPlay,
  VoidCallback onAddToQueue,
});

UseActionCallbacks useActionCallbacks(WidgetRef ref) {
  final isLoading = useState(false);
  final context = useContext();
  final options = TrackPresentationOptions.of(context);
  final playlist = ref.watch(audioPlayerProvider);
  final playlistNotifier = ref.watch(audioPlayerProvider.notifier);
  final historyNotifier = ref.watch(playbackHistoryActionsProvider);

  final isActive = useMemoized(
    () => playlist.collections.contains(options.collectionId),
    [playlist.collections, options.collectionId],
  );

  final onShuffle = useCallback(() async {
    try {
      isLoading.value = true;

      final initialTracks = options.tracks;
      if (!context.mounted) return;

      final isRemoteDevice = await showSelectDeviceDialog(context, ref);
      if (isRemoteDevice == null) return;
      if (isRemoteDevice) {
        final allTracks = await options.pagination.onFetchAll();
        final remotePlayback = ref.read(connectProvider.notifier);
        await remotePlayback.load(
          options.collection is DeeMusiqSimpleAlbumObject
              ? WebSocketLoadEventData.album(
                  tracks: allTracks,
                  collection: options.collection as DeeMusiqSimpleAlbumObject,
                  initialIndex: Random().nextInt(allTracks.length))
              : WebSocketLoadEventData.playlist(
                  tracks: allTracks,
                  collection: options.collection as DeeMusiqSimplePlaylistObject,
                  initialIndex: Random().nextInt(allTracks.length),
                ),
        );
        await remotePlayback.setShuffle(true);
      } else {
        await playlistNotifier.load(
          initialTracks,
          autoPlay: true,
          initialIndex: Random().nextInt(initialTracks.length),
        );
        await audioPlayer.setShuffle(true);
        playlistNotifier.addCollection(options.collectionId);
        if (options.collection is DeeMusiqSimpleAlbumObject) {
          historyNotifier
              .addAlbums([options.collection as DeeMusiqSimpleAlbumObject]);
        } else {
          historyNotifier.addPlaylists(
              [options.collection as DeeMusiqSimplePlaylistObject]);
        }

        final allTracks = await options.pagination.onFetchAll();

        await playlistNotifier.addTracks(
          allTracks.sublist(initialTracks.length),
        );
      }
    } catch (e, stack) {
      AppLogger.reportError(e, stack);
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }, [options, playlistNotifier, historyNotifier]);

  final onPlay = useCallback(() async {
    try {
      isLoading.value = true;

      final initialTracks = options.tracks;

      if (!context.mounted) return;

      final isRemoteDevice = await showSelectDeviceDialog(context, ref);
      if (isRemoteDevice == null) return;
      if (isRemoteDevice) {
        final allTracks = await options.pagination.onFetchAll();

        final remotePlayback = ref.read(connectProvider.notifier);
        await remotePlayback.load(
          options.collection is DeeMusiqSimpleAlbumObject
              ? WebSocketLoadEventData.album(
                  tracks: allTracks,
                  collection: options.collection as DeeMusiqSimpleAlbumObject,
                )
              : WebSocketLoadEventData.playlist(
                  tracks: allTracks,
                  collection: options.collection as DeeMusiqSimplePlaylistObject,
                ),
        );
      } else {
        if (initialTracks.isEmpty) return;

        await playlistNotifier.load(initialTracks, autoPlay: true);
        playlistNotifier.addCollection(options.collectionId);

        if (options.collection is DeeMusiqSimpleAlbumObject) {
          historyNotifier.addAlbums(
            [options.collection as DeeMusiqSimpleAlbumObject],
          );
        } else {
          historyNotifier.addPlaylists(
            [options.collection as DeeMusiqSimplePlaylistObject],
          );
        }

        final allTracks = await options.pagination.onFetchAll();

        await playlistNotifier.addTracks(
          allTracks.sublist(initialTracks.length),
        );
      }
    } catch (e, stack) {
      AppLogger.reportError(e, stack);
      rethrow;
    } finally {
      if (context.mounted) {
        isLoading.value = false;
      }
    }
  }, [options, playlistNotifier, historyNotifier]);

  final onAddToQueue = useCallback(() {
    final tracks = options.tracks;
    playlistNotifier.addTracks(tracks);
    playlistNotifier.addCollection(options.collectionId);
    if (options.collection is DeeMusiqSimpleAlbumObject) {
      historyNotifier
          .addAlbums([options.collection as DeeMusiqSimpleAlbumObject]);
    } else {
      historyNotifier
          .addPlaylists([options.collection as DeeMusiqSimplePlaylistObject]);
    }
    if (!context.mounted) return;
    showToastForAction(context, "add-to-queue", tracks.length);
  }, [options, playlistNotifier, historyNotifier]);

  return (
    isActive: isActive,
    isLoading: isLoading.value,
    onShuffle: onShuffle,
    onPlay: onPlay,
    onAddToQueue: onAddToQueue,
  );
}
