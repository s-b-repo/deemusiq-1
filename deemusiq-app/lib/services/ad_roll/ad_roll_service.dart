import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:deemusiq/services/logger/logger.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';

/// Controls when ads are injected into the playback queue. Fetches ad
/// inventory from the DeeMusiq backend (GET /ads/next) — all ads are YouTube
/// videos whose audio is extracted via the app's YouTube engine.
///
/// ## Flow
/// 1. After every [songsBetweenAds] (default 6) completed songs, the app
///    calls `GET /ads/next` with an `exclude` list of ad IDs already heard
///    this session.
/// 2. The backend returns an ad with a YouTube video ID. The app extracts
///    audio-only from that video using `youtube_explode_dart`.
/// 3. The ad plays, the user can skip it, and the counter resets.
/// 4. If the backend is unreachable or returns no ads, the ad break is
///    silently skipped.
///
/// ## Backend API
/// ```
/// GET /ads/next?exclude=id1,id2
/// Authorization: Bearer <token>
///
/// Response: { ad: { id, youtubeId, label, tagline, skippable } | null }
/// ```
class AdRollService {
  AdRollService._();
  static final AdRollService instance = AdRollService._();

  static const _songsSinceLastAdKey = 'deemusiq_adroll_songs';
  static const _excludeKey = 'deemusiq_adroll_exclude';

  /// Songs between ad breaks (configurable). Default 6.
  int songsBetweenAds = 6;

  /// Whether ads are enabled.
  bool enabled = false;

  int _songsSinceLastAd = 0;
  final Set<String> _excludeIds = {}; // ad IDs already heard this session

  bool _adPlaying = false;
  bool get isAdPlaying => _adPlaying;

  final _adStateController = StreamController<bool>.broadcast();
  Stream<bool> get adStateStream => _adStateController.stream;

  AdSlot? _currentAd;

  /// Initialize from persistent storage.
  Future<void> init() async {
    final prefs = KVStoreService.sharedPreferences;
    _songsSinceLastAd = prefs.getInt(_songsSinceLastAdKey) ?? 0;
    final raw = prefs.getString(_excludeKey);
    if (raw != null) {
      try {
        _excludeIds.addAll((jsonDecode(raw) as List).cast<String>());
      } catch (_) {}
    }
  }

  /// Call after every non-ad track completes. Returns an [AdSlot] if an ad
  /// should be inserted, or null to continue normally.
  Future<AdSlot?> onTrackCompleted() async {
    if (!enabled) return null;

    _songsSinceLastAd++;
    _persistCount();

    if (_songsSinceLastAd < songsBetweenAds) return null;

    _songsSinceLastAd = 0;
    _persistCount();

    // Fetch next ad from backend.
    final ad = await _fetchAdFromBackend();
    if (ad != null) {
      _currentAd = ad;
      _excludeIds.add(ad.id);
      _persistExclude();
      return ad;
    }

    return null; // no ad available — skip silently
  }

  /// Fetch the next ad from the backend. Returns null if no ads available or
  /// the backend is unreachable.
  Future<AdSlot?> _fetchAdFromBackend() async {
    final api = WalletApiClient.instance;
    if (!api.isConfigured) return null;

    try {
      final dio = _client();
      final exclude = _excludeIds.isNotEmpty
          ? _excludeIds.join(',')
          : null;

      final res = await dio.get(
        '/ads/next',
        queryParameters: exclude != null ? {'exclude': exclude} : null,
      );

      final data = res.data as Map<String, dynamic>;
      final adJson = data['ad'] as Map<String, dynamic>?;
      if (adJson == null) return null;

      return AdSlot(
        id: adJson['id'] as String,
        youtubeId: adJson['youtubeId'] as String,
        label: adJson['label'] as String,
        tagline: adJson['tagline'] as String,
        skippable: (adJson['skippable'] as bool?) ?? true,
        durationSeconds: 15,
      );
    } catch (e) {
      AppLogger.reportError('AdRoll: backend fetch failed', StackTrace.current);
      return null; // silent skip — never interrupt playback for ad errors
    }
  }

  /// The user skipped the current ad.
  void onSkipAd() {
    _adPlaying = false;
    _currentAd = null;
    _adStateController.add(false);
  }

  /// The ad finished playing naturally.
  void onAdCompleted() {
    _adPlaying = false;
    _currentAd = null;
    _adStateController.add(false);
  }

  /// Call when an ad starts playing to update UI state.
  void markAdStarted() {
    _adPlaying = true;
    _adStateController.add(true);
  }

  /// The currently-playing ad, or null.
  AdSlot? get currentAd => _currentAd;

  void _persistCount() {
    KVStoreService.sharedPreferences.setInt(
      _songsSinceLastAdKey,
      _songsSinceLastAd,
    );
  }

  void _persistExclude() {
    KVStoreService.sharedPreferences.setString(
      _excludeKey,
      jsonEncode(_excludeIds.toList()),
    );
  }

  /// Resets the exclude set (e.g. on new session / app restart).
  void resetExclude() {
    _excludeIds.clear();
    _persistExclude();
  }

  void dispose() {
    _adStateController.close();
  }

  /// Creates a Dio client pointed at the backend.
  Dio _client() {
    return Dio(BaseOptions(
      baseUrl: PaymentGatewayConfig.backendBaseUrl,
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ));
  }
}

/// An ad fetched from the backend, ready to be inserted into the queue.
class AdSlot {
  final String id;           // backend ad ID (used for exclude tracking)
  final String youtubeId;    // 11-char YouTube video ID
  final String label;        // shown in the player UI
  final String tagline;      // short tagline
  final bool skippable;
  final int durationSeconds; // approximate

  const AdSlot({
    required this.id,
    required this.youtubeId,
    required this.label,
    required this.tagline,
    required this.skippable,
    required this.durationSeconds,
  });

  /// The full YouTube watch URL (resolved by the YouTube engine to audio-only).
  String get youtubeUrl => 'https://www.youtube.com/watch?v=$youtubeId';
}
