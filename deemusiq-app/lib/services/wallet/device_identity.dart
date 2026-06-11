import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:deemusiq/services/kv_store/encrypted_kv_store.dart';

/// Per-device Ed25519 identity for the DeeMusiq backend.
///
/// The private key SEED lives only in the platform secure enclave (Android
/// Keystore / iOS Keychain, via flutter_secure_storage) and NEVER leaves the
/// device. The backend only ever receives the public key and verifies the
/// device's signature over a fresh server challenge — so a stolen device id is
/// useless on its own, and no secret travels the wire.
class DeviceIdentity {
  DeviceIdentity._();
  static final DeviceIdentity instance = DeviceIdentity._();

  static const _seedKey = "deemusiq_device_ed25519_seed_v1";
  final _algorithm = Ed25519();
  SimpleKeyPair? _cached;

  Future<SimpleKeyPair> _keyPair() async {
    if (_cached != null) return _cached!;
    final storage = EncryptedKvStoreService.storage;
    final existing = await storage.read(key: _seedKey);
    if (existing != null && existing.isNotEmpty) {
      _cached = await _algorithm.newKeyPairFromSeed(base64.decode(existing));
      return _cached!;
    }
    final pair = await _algorithm.newKeyPair();
    final seed = await pair.extractPrivateKeyBytes();
    await storage.write(key: _seedKey, value: base64.encode(seed));
    _cached = pair;
    return pair;
  }

  /// base64 of the raw 32-byte Ed25519 public key (sent on first login).
  Future<String> publicKeyBase64() async {
    final pub = await (await _keyPair()).extractPublicKey();
    if (pub.bytes.length != 32) {
      throw StateError(
        "Unexpected Ed25519 public key length: ${pub.bytes.length}",
      );
    }
    return base64.encode(pub.bytes);
  }

  /// base64 of the raw 64-byte signature over [message] (the server challenge).
  Future<String> sign(String message) async {
    final signature = await _algorithm.sign(
      utf8.encode(message),
      keyPair: await _keyPair(),
    );
    return base64.encode(signature.bytes);
  }
}
