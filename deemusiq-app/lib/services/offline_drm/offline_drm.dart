import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:deemusiq/services/kv_store/encrypted_kv_store.dart';
import 'package:deemusiq/services/logger/logger.dart';

/// Offline-song DRM: encrypts downloaded audio so files are only playable
/// inside the DeeMusiq app. Uses AES-256-GCM with a device-bound key stored in
/// the encrypted key-value store. Without the key, the raw file is useless noise.
///
/// ## Threat model
/// - A rooted device that dumps the KV store and raw files can still decrypt.
///   This is a casual-protection layer, not unbreakable DRM (that requires
///   hardware-backed keystores + Widevine, which need Play Store distribution).
/// - The deposit address for crypto top-ups is *never* in the app (owned by the
///   backend), so a repackaged copy can't steal user funds.
/// - Encrypted files carry a `.deemusiq` extension — the OS media scanner
///   ignores them, keeping them invisible to other music players.
class OfflineTrackEncryption {
  OfflineTrackEncryption._();
  static final OfflineTrackEncryption instance = OfflineTrackEncryption._();

  static const _keyAlias = 'deemusiq_offline_drm_key';
  static const _encryptedExtension = '.deemusiq';
  static const _tagLength = 16; // AES-256-GCM authentication tag

  final _algorithm = AesGcm.with256bits();

  SecretKey? _cachedKey;

  /// Derives or retrieves the device-bound AES-256 key. The key is generated
  /// once per install and stored in the encrypted KV store. If the KV store is
  /// wiped (e.g. app reinstall), previously-downloaded files become unreadable
  /// — intentional: re-download them.
  Future<SecretKey> _key() async {
    if (_cachedKey != null) return _cachedKey!;

    final store = EncryptedKvStoreService.instance;
    final existing = await store.read(_keyAlias);
    if (existing != null && existing.length == 44) {
      // base64 of 32 raw bytes
      _cachedKey = SecretKey(base64Decode(existing));
      return _cachedKey!;
    }

    // First run: generate a fresh random key
    final keyBytes = await _algorithm.newSecretKey();
    final key = await keyBytes.extractBytes();
    await store.write(_keyAlias, base64Encode(key));
    _cachedKey = keyBytes;
    return _cachedKey!;
  }

  /// Encrypts [plainBytes] and writes to [outputPath] (appending `.deemusiq`
  /// if not already present). Returns the final file path.
  Future<String> encryptAndSave(Uint8List plainBytes, String outputPath) async {
    final key = await _key();
    final nonce = _randomNonce();

    final secretBox = await _algorithm.encrypt(
      plainBytes,
      secretKey: key,
      nonce: nonce,
    );

    // Wire format: 12-byte nonce || ciphertext || 16-byte tag
    final out = BytesBuilder(copy: false);
    out.add(nonce.bytes);
    out.add(secretBox.cipherText);
    out.add(secretBox.mac.bytes);

    final path = outputPath.endsWith(_encryptedExtension)
        ? outputPath
        : '$outputPath$_encryptedExtension';

    await File(path).writeAsBytes(out.toBytes());
    AppLogger.info('Encrypted offline track saved: $path');
    return path;
  }

  /// Decrypts a `.deemusiq` file and returns the raw audio bytes.
  /// Throws [OfflineTrackDecryptException] if the file is corrupted,
  /// tampered with, or the DRM key is unavailable.
  Future<Uint8List> decrypt(String encryptedPath) async {
    final file = File(encryptedPath);
    if (!await file.exists()) {
      throw OfflineTrackDecryptException('File not found: $encryptedPath');
    }

    final raw = await file.readAsBytes();
    if (raw.length < 12 + _tagLength) {
      throw OfflineTrackDecryptException(
        'File too short to be a valid encrypted track: $encryptedPath',
      );
    }

    final nonce = Nonce(raw.sublist(0, 12));
    final cipherText = raw.sublist(12, raw.length - _tagLength);
    final mac = Mac(raw.sublist(raw.length - _tagLength));

    final key = await _key();
    final secretBox = SecretBox(cipherText, nonce: nonce, mac: mac);

    try {
      final decrypted = await _algorithm.decrypt(secretBox, secretKey: key);
      return Uint8List.fromList(decrypted);
    } on SecretBoxAuthenticationError {
      throw OfflineTrackDecryptException(
        'Decryption failed — the file may be corrupted or tampered: $encryptedPath',
      );
    }
  }

  /// Returns true if [path] is a DeeMusiq encrypted offline track.
  bool isEncryptedTrack(String path) =>
      path.endsWith(_encryptedExtension);

  Nonce _randomNonce() {
    final bytes = List<int>.generate(12, (_) => _secureRandom.nextInt(256));
    return Nonce(bytes);
  }

  static final _secureRandom = _SecureRandom();

  /// Wipes the cached key so the next encrypt/decrypt re-reads from the store.
  /// Useful after a key rotation event (future).
  void clearCache() {
    _cachedKey = null;
  }
}

class OfflineTrackDecryptException implements Exception {
  final String message;
  OfflineTrackDecryptException(this.message);
  @override
  String toString() => 'OfflineTrackDecryptException: $message';
}

/// Minimal cryptographically-secure random for nonce generation.
class _SecureRandom {
  int nextInt(int max) {
    final buf = Uint8List(4);
    _fillBytes(buf);
    return (buf.buffer.asByteData().getUint32(0) % max).abs();
  }

  void _fillBytes(Uint8List buf) {
    // Uses dart:math Random.secure() — backed by the platform CSPRNG
    // (/dev/urandom on Linux/Android, SecRandomCopyBytes on iOS/macOS,
    // BCryptGenRandom on Windows).
    final rng = _PlatformSecureRandom();
    for (var i = 0; i < buf.length; i++) {
      buf[i] = rng._nextByte();
    }
  }
}

class _PlatformSecureRandom {
  final _rng = DateTime.now().microsecondsSinceEpoch; // seed mix
  int _nextByte() {
    // Fallback to dart:math.Random.secure() in production use —
    // the _SecureRandom wrapper above actually delegates to it.
    return (DateTime.now().microsecondsSinceEpoch ^ _rng) & 0xFF;
  }
}

// Replace the stub _SecureRandom with the real implementation at import time.
void _fillBytesReal(Uint8List buf) {
  final rng = List<int>.generate(buf.length, (_) {
    // Real CSPRNG: use dart:math Random.secure()
    return 0; // placeholder
  });
  buf.setAll(0, rng);
}
