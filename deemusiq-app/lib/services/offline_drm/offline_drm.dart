import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:deemusiq/services/kv_store/kv_store.dart';
import 'package:deemusiq/services/logger/logger.dart';

/// Offline-song DRM: encrypts downloaded audio so files are only playable
/// inside the DeeMusiq app. Uses AES-256-CBC with a device-bound key stored
/// in the key-value store. Without the key, the raw file is useless noise.
///
/// ## Threat model
/// - A rooted device that dumps the KV store and raw files can still decrypt.
///   This is a casual-protection layer, not unbreakable DRM (that needs
///   hardware-backed keystores + Widevine, which require Play Store).
/// - The deposit address for crypto top-ups is *never* in the app (owned by
///   the backend), so a repackaged copy can't steal user funds.
/// - Encrypted files carry a `.deemusiq` extension — the OS media scanner
///   ignores them, keeping them invisible to other music players.
class OfflineTrackEncryption {
  OfflineTrackEncryption._();
  static final OfflineTrackEncryption instance = OfflineTrackEncryption._();

  static const _keyAlias = 'deemusiq_offline_drm_key';
  static const _encryptedExtension = '.deemusiq';

  enc.Key? _cachedKey;
  enc.IV? _cachedIV;

  /// Derives or retrieves the device-bound AES-256 key + IV. Generated once
  /// per install and stored in the KV store. If wiped (reinstall), previously
  /// downloaded files become unreadable — re-download them.
  Future<enc.Key> _key() async {
    if (_cachedKey != null) return _cachedKey!;

    final prefs = KVStoreService.sharedPreferences;
    final existing = prefs.getString(_keyAlias);
    if (existing != null && existing.length >= 44) {
      try {
        final decoded = base64Decode(existing);
        _cachedKey = enc.Key(decoded.sublist(0, 32));
        _cachedIV = enc.IV(decoded.sublist(32, 48));
        return _cachedKey!;
      } catch (_) {
        // Corrupt stored key — regenerate
      }
    }

    // First run: generate a fresh random key + IV
    final keyBytes = _secureBytes(32);
    final ivBytes = _secureBytes(16);
    _cachedKey = enc.Key(keyBytes);
    _cachedIV = enc.IV(ivBytes);

    final combined = Uint8List(48);
    combined.setAll(0, keyBytes);
    combined.setAll(32, ivBytes);
    prefs.setString(_keyAlias, base64Encode(combined));

    return _cachedKey!;
  }

  Future<enc.IV> _iv() async {
    if (_cachedIV != null) return _cachedIV!;
    await _key();
    return _cachedIV!;
  }

  /// Encrypts [plainBytes] and writes to [outputPath] (appending `.deemusiq`).
  Future<String> encryptAndSave(Uint8List plainBytes, String outputPath) async {
    final key = await _key();
    final iv = await _iv();

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final encrypted = encrypter.encryptBytes(plainBytes, iv: iv);

    final path = outputPath.endsWith(_encryptedExtension)
        ? outputPath
        : '$outputPath$_encryptedExtension';

    await File(path).writeAsBytes(encrypted.bytes);
    AppLogger.log.i('Encrypted offline track: $path');
    return path;
  }

  /// Decrypts a `.deemusiq` file and returns raw audio bytes.
  Future<Uint8List> decrypt(String encryptedPath) async {
    final file = File(encryptedPath);
    if (!await file.exists()) {
      throw OfflineTrackDecryptException('File not found: $encryptedPath');
    }

    final raw = await file.readAsBytes();
    if (raw.length < 16) {
      throw OfflineTrackDecryptException('File too short: $encryptedPath');
    }

    final key = await _key();
    final iv = await _iv();

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    try {
      final decrypted = encrypter.decryptBytes(enc.Encrypted(raw), iv: iv);
      return Uint8List.fromList(decrypted);
    } catch (e) {
      throw OfflineTrackDecryptException(
        'Decryption failed — file may be corrupted or tampered: $encryptedPath',
      );
    }
  }

  bool isEncryptedTrack(String path) => path.endsWith(_encryptedExtension);

  void clearCache() {
    _cachedKey = null;
    _cachedIV = null;
  }

  static Uint8List _secureBytes(int length) {
    final random = Random.secure();
    return Uint8List.fromList(List.generate(length, (_) => random.nextInt(256)));
  }
}

class OfflineTrackDecryptException implements Exception {
  final String message;
  OfflineTrackDecryptException(this.message);
  @override
  String toString() => 'OfflineTrackDecryptException: $message';
}
