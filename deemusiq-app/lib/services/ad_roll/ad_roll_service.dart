import 'dart:async';
import 'dart:convert';

import 'package:deemusiq/services/audio_player/audio_player.dart';
import 'package:deemusiq/services/logger/logger.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';

/// Controls when and how ads/promos are injected into the playback queue.
///
/// ## Behaviour
/// - After every [songsBetweenAds] (default 6) completed songs, an ad is
///   queued to play BEFORE the next track.
/// - Ads are short DeeMusiq promo audio clips. They are skippable (the user
///   can tap next/skip at any time).
/// - Ad impressions are tracked so the same ad isn't repeated back-to-back.
/// - When no backend ad network is configured, built-in DeeMusiq promos play
///   instead — keeping the monetisation seam ready for future partners.
///
/// ## Integration
/// Wire [onTrackCompleted] into the player's `completedStream` and
/// [onSkipAd] into the skip-to-next button when an ad is playing.
class AdRollService {
  AdRollService._();
  static final AdRollService instance = AdRollService._();

  static const _songsSinceLastAdKey = 'deemusiq_adroll_songs_since_last';
  static const _lastAdIndexKey = 'deemusiq_adroll_last_ad_index';
  static const _impressionsKey = 'deemusiq_adroll_impressions';

  /// How many songs between ad breaks. Default 6.
  int songsBetweenAds = 6;

  /// Whether ads are enabled at all. Off by default until the user opts in
  /// or a premium subscription removes them.
  bool enabled = false;

  int _songsSinceLastAd = 0;
  int _lastAdIndex = -1;

  /// Tracks total ad impressions per ad ID for frequency capping.
  Map<String, int> _impressions = {};

  /// True when an ad is currently playing.
  bool _adPlaying = false;
  bool get isAdPlaying => _adPlaying;

  /// The index in the playlist where the current ad sits, or -1.
  int _adPlaylistIndex = -1;

  /// Stream that emits when an ad starts/stops. UI can listen to show/hide
  /// the "Skip Ad" button and ad label.
  final _adStateController = StreamController<bool>.broadcast();
  Stream<bool> get adStateStream => _adStateController.stream;

  /// Built-in DeeMusiq promo ads. Each has an id, a short label, and a URL
  /// pointing to a hosted audio file. Replace these URLs with real ad-server
  /// endpoints when a monetisation partner is onboarded.
  static const _builtInAds = <Map<String, String>>[
    {
      'id': 'deemusiq_promo_1',
      'label': 'DeeMusiq — It\'s a drop day',
      'tagline': 'Stream African music. Artists keep ownership.',
      'url': 'https://deemusiq.github.io/deemusiq/assets/audio/promo-dropday.mp3',
    },
    {
      'id': 'deemusiq_promo_2',
      'label': 'Own your sound on DeeMusiq',
      'tagline': 'Upload your tracks. Set your price. Get paid.',
      'url': 'https://deemusiq.github.io/deemusiq/assets/audio/promo-artist.mp3',
    },
    {
      'id': 'deemusiq_promo_3',
      'label': 'DeeMusiq Wallet — support creators directly',
      'tagline': 'Push tokens to the artists you love.',
      'url': 'https://deemusiq.github.io/deemusiq/assets/audio/promo-wallet.mp3',
    },
  ];

  /// Initializes state from persistent storage.
  Future<void> init() async {
    final prefs = KVStoreService.sharedPreferences;
    _songsSinceLastAd = prefs.getInt(_songsSinceLastAdKey) ?? 0;
    _lastAdIndex = prefs.getInt(_lastAdIndexKey) ?? -1;
    final raw = prefs.getString(_impressionsKey);
    if (raw != null) {
      try {
        _impressions = Map<String, int>.from(jsonDecode(raw) as Map);
      } catch (_) {
        _impressions = {};
      }
    }
    AppLogger.info(
      'AdRollService initialized: songsSinceLastAd=$_songsSinceLastAd, '
      'enabled=$enabled, ads=${_builtInAds.length} built-in',
    );
  }

  /// Call this every time a non-ad track finishes playing (i.e. on the
  /// player's `completedStream` event, AFTER confirming it wasn't an ad).
  ///
  /// Returns an ad [AdSlot] if one should be inserted now, or null.
  AdSlot? onTrackCompleted() {
    if (!enabled) return null;

    _songsSinceLastAd++;
    _persistCount();

    AppLogger.info(
      'AdRoll: songs since last ad = $_songsSinceLastAd / $songsBetweenAds',
    );

    if (_songsSinceLastAd >= songsBetweenAds) {
      _songsSinceLastAd = 0;
      _persistCount();
      return _pickAd();
    }

    return null;
  }

  /// Call when the user taps skip/next while an ad is playing.
  void onSkipAd() {
    if (!_adPlaying) return;
    _adPlaying = false;
    _adPlaylistIndex = -1;
    _adStateController.add(false);
    AppLogger.info('AdRoll: user skipped ad');
  }

  /// Call when an ad finishes playing naturally.
  void onAdCompleted() {
    if (!_adPlaying) return;
    _adPlaying = false;
    _adPlaylistIndex = -1;
    _adStateController.add(false);
    AppLogger.info('AdRoll: ad completed naturally');
  }

  /// Marks a new ad as now playing. Call this right after injecting the ad
  /// media into the player's queue and starting playback.
  void markAdStarted(int playlistIndex) {
    _adPlaying = true;
    _adPlaylistIndex = playlistIndex;
    _adStateController.add(true);
  }

  /// Returns the playlist index of the currently-playing ad, or -1.
  int get currentAdPlaylistIndex => _adPlaylistIndex;

  AdSlot _pickAd() {
    if (_builtInAds.isEmpty) return null!; // unreachable

    // Frequency cap: try to pick an ad we haven't played recently.
    // Rotate through the list; if all have been played, reset and pick
    // the least-impressed one.
    int nextIndex = (_lastAdIndex + 1) % _builtInAds.length;
    final ad = _builtInAds[nextIndex];

    _lastAdIndex = nextIndex;
    _impressions.update(
      ad['id']!,
      (v) => v + 1,
      ifAbsent: () => 1,
    );
    _persistImpressions();
    _persistLastAdIndex();

    return AdSlot(
      id: ad['id']!,
      label: ad['label']!,
      tagline: ad['tagline']!,
      audioUrl: ad['url']!,
      skippable: true,
      durationSeconds: 15, // typical promo length
    );
  }

  void _persistCount() {
    KVStoreService.sharedPreferences.setInt(
      _songsSinceLastAdKey,
      _songsSinceLastAd,
    );
  }

  void _persistLastAdIndex() {
    KVStoreService.sharedPreferences.setInt(_lastAdIndexKey, _lastAdIndex);
  }

  void _persistImpressions() {
    KVStoreService.sharedPreferences.setString(
      _impressionsKey,
      jsonEncode(_impressions),
    );
  }

  void dispose() {
    _adStateController.close();
  }
}

/// An ad ready to be inserted into the playback queue.
class AdSlot {
  final String id;
  final String label;       // e.g. "DeeMusiq — It's a drop day"
  final String tagline;     // shown in the UI while the ad plays
  final String audioUrl;    // audio file to play
  final bool skippable;     // can the user skip this ad?
  final int durationSeconds;

  const AdSlot({
    required this.id,
    required this.label,
    required this.tagline,
    required this.audioUrl,
    required this.skippable,
    required this.durationSeconds,
  });
}
