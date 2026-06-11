import 'dart:convert';

import 'package:encrypt/encrypt.dart' as enc;
import 'package:deemusiq/services/wallet/payment_service.dart'
    show PaymentGatewayConfig;

/// In-transit payload encryption for the DeeMusiq backend ("secure channel").
///
/// Sensitive request/response BODIES are sealed in an AES-256-GCM envelope using
/// a PRE-SHARED 256-bit key ([PaymentGatewayConfig.secureChannelKey], shared
/// with the backend's `SECURE_CHANNEL_KEY`). This is quantum-resistant by
/// design — there is no RSA/ECDH key exchange for a quantum computer to break
/// (Shor's), and AES-256 keeps ~128-bit security against Grover's. It works over
/// plain HTTP, so a raw `http://IP:port` backend is safe, and stacks under
/// TLS/HTTP-3 when available (defence in depth).
///
/// Wire format (matches the backend `util/secureChannel.ts`; the `encrypt`
/// package appends the 16-byte GCM tag to the ciphertext):
///   { "v": 1, "iv": base64(12-byte nonce), "ct": base64(ciphertext || tag) }
abstract class SecureChannel {
  static const _header = "X-DM-Enc";
  static String get headerName => _header;

  /// True when a valid 32-byte key is configured.
  static bool get enabled {
    final k = PaymentGatewayConfig.secureChannelKey;
    if (k.isEmpty) return false;
    try {
      return base64.decode(k).length == 32;
    } catch (_) {
      return false;
    }
  }

  static enc.Encrypter _encrypter() {
    final key = enc.Key.fromBase64(PaymentGatewayConfig.secureChannelKey);
    return enc.Encrypter(enc.AES(key, mode: enc.AESMode.gcm));
  }

  /// Paths that must stay plaintext (mirrors the backend exemptions).
  static bool isExemptPath(String path) {
    return path == "/health" ||
        path == "/" ||
        path.startsWith("/webhooks") ||
        path.contains("/callback") ||
        path.contains("/return");
  }

  /// Seal a JSON string into an envelope map ready to send as the request body.
  static Map<String, dynamic> seal(String plainJson) {
    final iv = enc.IV.fromSecureRandom(12);
    final encrypted = _encrypter().encryptBytes(utf8.encode(plainJson), iv: iv);
    return {"v": 1, "iv": iv.base64, "ct": encrypted.base64};
  }

  /// Open an envelope map back into its JSON string.
  static String open(Map<String, dynamic> envelope) {
    final iv = enc.IV.fromBase64(envelope["iv"] as String);
    final ct = enc.Encrypted.fromBase64(envelope["ct"] as String);
    return utf8.decode(_encrypter().decryptBytes(ct, iv: iv));
  }

  /// True if [data] looks like one of our envelopes.
  static bool isEnvelope(Object? data) =>
      data is Map && data["iv"] is String && data["ct"] is String;
}
