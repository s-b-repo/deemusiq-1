import 'dart:async';

import 'package:deemusiq/services/logger/logger.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';

/// VLC-style audio equalizer with named presets, backed by libmpv's `af`
/// (audio filter) graph. Each preset maps to an mpv `equalizer` filter string
/// that controls a 10-band equalizer (31 Hz – 16 kHz).
///
/// ## Presets (ported from VLC's equalizer defaults)
/// - Flat (off)
/// - Classical, Club, Dance, Full Bass, Full Treble
/// - Headphones, Large Hall, Live, Party, Pop
/// - Reggae, Rock, Ska, Soft, Soft Rock, Techno
/// - DeeMusiq (custom: warm, vocal-forward for African music)
///
/// ## Integration
/// Set the preset via [setPreset] and the equalizer is applied immediately.
/// The active preset is persisted across app restarts.
class AudioEqualizer {
  AudioEqualizer._();
  static final AudioEqualizer instance = AudioEqualizer._();

  static const _presetKey = 'deemusiq_eq_preset';
  static const _enabledKey = 'deemusiq_eq_enabled';

  /// The mpv `NativePlayer` instance — set by the audio player on init.
  /// When null, equalizer commands are silently dropped (safe no-op).
  dynamic _nativePlayer;

  bool _enabled = false;
  String _preset = 'Flat';

  bool get isEnabled => _enabled;
  String get activePreset => _preset;

  /// Wire this to the CustomPlayer's nativePlayer after the player is created.
  void attach(dynamic nativePlayer) {
    _nativePlayer = nativePlayer;
    // Re-apply current preset after re-attach (e.g. player re-init).
    if (_enabled && _preset != 'Flat') {
      _applyPreset(_preset);
    }
  }

  /// Loads persisted state. Call once during app init.
  Future<void> init() async {
    final prefs = KVStoreService.sharedPreferences;
    _enabled = prefs.getBool(_enabledKey) ?? false;
    _preset = prefs.getString(_presetKey) ?? 'Flat';
    AppLogger.log.i('Equalizer: enabled=$_enabled preset=$_preset');
  }

  /// Enables/disables the equalizer. When disabled, the filter chain is cleared
  /// (flat response). When enabled, the last active preset is re-applied.
  Future<void> setEnabled(bool enabled) async {
    _enabled = enabled;
    await KVStoreService.sharedPreferences.setBool(_enabledKey, enabled);
    if (enabled) {
      _applyPreset(_preset);
    } else {
      _clearFilter();
    }
    AppLogger.log.i('Equalizer: enabled=$enabled');
  }

  /// Applies a named preset. If the equalizer is disabled, the preset is
  /// stored but not applied until re-enabled.
  Future<void> setPreset(String preset) async {
    if (!_presets.containsKey(preset)) {
      AppLogger.log.w('Equalizer: unknown preset "$preset", ignoring');
      return;
    }
    _preset = preset;
    await KVStoreService.sharedPreferences.setString(_presetKey, preset);
    if (_enabled) {
      _applyPreset(preset);
    }
    AppLogger.log.i('Equalizer: preset=$preset');
  }

  /// Toggles the equalizer on/off.
  Future<void> toggle() => setEnabled(!_enabled);

  /// Available presets (matching VLC's naming).
  List<String> get availablePresets => _presets.keys.toList();

  void _applyPreset(String name) {
    final gains = _presets[name];
    if (gains == null || _nativePlayer == null) return;

    // Build the mpv equalizer filter string.
    // Format: "equalizer=f1=...:f2=...:...:f10=..."
    // Frequencies: 31, 63, 125, 250, 500, 1k, 2k, 4k, 8k, 16k Hz
    // Each fN value is in dB, clamped to [-12, 12].
    final bandNames = ['f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10'];
    final parts = <String>[];
    for (var i = 0; i < bandNames.length && i < gains.length; i++) {
      final db = gains[i].clamp(-12.0, 12.0);
      parts.add('${bandNames[i]}=${db.toStringAsFixed(1)}');
    }

    final filter = 'equalizer=${parts.join(':')}';
    try {
      _nativePlayer.setProperty('af', filter);
    } catch (e) {
      AppLogger.reportError('Equalizer apply failed: $filter', StackTrace.current);
    }
  }

  void _clearFilter() {
    if (_nativePlayer == null) return;
    try {
      _nativePlayer.setProperty('af', '');
    } catch (_) {}
  }

  /// All presets, ported from VLC's default equalizer configuration.
  /// Each list contains 10 gain values in dB for bands:
  ///   31 Hz, 63 Hz, 125 Hz, 250 Hz, 500 Hz, 1 kHz, 2 kHz, 4 kHz, 8 kHz, 16 kHz
  static const _presets = <String, List<double>>{
    'Flat':        [ 0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0],
    'Classical':   [ 0.0,  0.0,  0.0,  0.0,  0.0,  0.0, -7.2, -7.2, -7.2, -9.6],
    'Club':        [ 0.0,  0.0,  8.0,  5.6,  5.6,  5.6,  3.2,  0.0,  0.0,  0.0],
    'Dance':       [ 9.6,  7.2,  2.4,  0.0,  0.0, -5.6, -7.2, -7.2,  0.0,  0.0],
    'Full Bass':   [-8.0,  9.6,  9.6,  5.6,  1.6, -4.0, -8.0,-10.4,-11.2,-11.2],
    'Full Treble': [-9.6, -9.6, -9.6, -4.0,  2.4, 11.2, 16.0, 16.0, 16.0, 16.8],
    'Headphones':  [ 4.8, 11.2,  5.6, -3.2, -2.4,  1.6,  4.8,  9.6, 12.8, 14.4],
    'Large Hall':  [10.4, 10.4,  5.6,  5.6,  0.0, -4.8, -4.8, -4.8,  0.0,  0.0],
    'Live':        [-4.8,  0.0,  4.0,  5.6,  5.6,  5.6,  4.0,  2.4,  2.4,  2.4],
    'Party':       [ 7.2,  7.2,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0,  7.2,  7.2],
    'Pop':         [-1.6,  4.8,  7.2,  8.0,  5.6,  0.0, -2.4, -2.4, -1.6, -1.6],
    'Reggae':      [ 0.0,  0.0, -0.8, -5.6,  0.0,  6.4,  6.4,  0.0,  0.0,  0.0],
    'Rock':        [ 8.0,  4.8, -5.6, -8.0, -3.2,  4.0,  8.8, 11.2, 11.2, 11.2],
    'Ska':         [-2.4, -4.8, -4.0,  0.0,  4.0,  5.6,  8.8,  9.6, 11.2,  9.6],
    'Soft':        [ 4.8,  1.6,  0.0, -2.4,  0.0,  4.0,  8.0,  9.6, 11.2, 12.0],
    'Soft Rock':   [ 4.0,  4.0,  2.4,  0.0, -4.0, -5.6, -3.2,  0.0,  2.4,  8.8],
    'Techno':      [ 8.0,  5.6,  0.0, -5.6, -4.8,  0.0,  8.0,  9.6,  9.6,  8.8],
    // DeeMusiq custom: warm low-end, clear mids for vocals, smooth highs.
    // Optimized for African music (Amapiano, Afrobeats, Maskandi, Gqom).
    'DeeMusiq':    [ 6.0,  4.0,  2.0,  0.0,  2.0,  3.0,  2.0,  1.0,  0.0, -1.0],
  };
}
