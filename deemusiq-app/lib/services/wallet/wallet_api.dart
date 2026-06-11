import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';
import 'package:deemusiq/services/wallet/payment_service.dart'
    show PaymentGatewayConfig;
import 'package:deemusiq/services/wallet/device_identity.dart';
import 'package:deemusiq/services/wallet/secure_channel.dart';
import 'package:uuid/uuid.dart';

class WalletApiException implements Exception {
  final String message;
  WalletApiException(this.message);
  @override
  String toString() => "WalletApiException: $message";
}

/// HTTP client for the DeeMusiq backend (see `/backend`). It is INERT until
/// [PaymentGatewayConfig.backendBaseUrl] is set: with no backend the app stays
/// fully local. Auth is device-based — a generated UUID is exchanged for a JWT.
class WalletApiClient {
  WalletApiClient._();
  static final WalletApiClient instance = WalletApiClient._();

  static const _deviceKey = "deemusiq_device_id";

  bool get isConfigured => PaymentGatewayConfig.backendBaseUrl.isNotEmpty;

  Dio _client() {
    final dio = Dio(
      BaseOptions(
        baseUrl: PaymentGatewayConfig.backendBaseUrl,
        connectTimeout: const Duration(seconds: 12),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Content-Type": "application/json"},
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (SecureChannel.enabled &&
              !SecureChannel.isExemptPath(options.path)) {
            options.headers[SecureChannel.headerName] = "1";
            if (options.data != null) {
              options.data = SecureChannel.seal(jsonEncode(options.data));
            }
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          final encrypted =
              response.headers.value(SecureChannel.headerName) == "1";
          if (encrypted && SecureChannel.isEnvelope(response.data)) {
            try {
              final plain = SecureChannel.open(
                Map<String, dynamic>.from(response.data as Map),
              );
              response.data = jsonDecode(plain);
            } catch (e) {
              // Corrupt/tampered ciphertext or a wrong channel key — surface a
              // clean error instead of throwing into Dio and breaking the app.
              handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  response: response,
                  message: "Could not decrypt the secure response.",
                ),
              );
              return;
            }
          }
          handler.next(response);
        },
        onError: (e, handler) {
          // A cached JWT that expired/was revoked → 401. Drop it so the next
          // call re-authenticates (Ed25519 challenge-response) instead of
          // cascading 401s forever.
          if (e.response?.statusCode == 401) _token = null;
          handler.next(e);
        },
      ),
    );
    return dio;
  }

  /// Drops the cached session token. The next authed call re-authenticates.
  void logout() {
    _token = null;
  }

  /// Cheap reachability probe. Returns true only when a backend is configured
  /// AND answers `/health` — the single gate for online-only features
  /// (downloads, payments, token balance, account linking).
  Future<bool> ping() async {
    if (!isConfigured) return false;
    try {
      final res = await _client().get(
        "/health",
        options: Options(
          sendTimeout: const Duration(seconds: 6),
          receiveTimeout: const Duration(seconds: 6),
        ),
      );
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  String _deviceId() {
    final prefs = KVStoreService.sharedPreferences;
    final existing = prefs.getString(_deviceKey);
    if (existing != null && existing.isNotEmpty) return existing;
    final id = const Uuid().v4();
    prefs.setString(_deviceKey, id);
    return id;
  }

  String? _token;

  /// Device login via Ed25519 challenge–response. The backend issues a signed
  /// challenge; we sign it with the device's secure-enclave key (never sent) and
  /// present the signature + public key. No secret ever travels the wire.
  Future<String> _authToken() async {
    if (_token != null) return _token!;
    try {
      final deviceId = _deviceId();
      final dio = _client();
      final challengeRes = await dio.post(
        "/auth/device/challenge",
        data: {"deviceId": deviceId},
      );
      final challenge = (challengeRes.data as Map)["challenge"] as String;
      final loginRes = await dio.post(
        "/auth/device/login",
        data: {
          "deviceId": deviceId,
          "publicKey": await DeviceIdentity.instance.publicKeyBase64(),
          "challenge": challenge,
          "signature": await DeviceIdentity.instance.sign(challenge),
        },
      );
      final token = (loginRes.data as Map)["token"] as String;
      _token = token;
      return token;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Attach an email + password to this wallet (works on any device after).
  Future<void> registerEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _client().post(
        "/auth/register",
        data: {"email": email, "password": password},
        options: await _authed(),
      );
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Log in with email + password (e.g. on a new device); caches the token.
  Future<void> loginEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client().post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      _token = (res.data as Map)["token"] as String;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Begin TOTP enrollment. Returns `{secret, otpauthUri}` to render a QR.
  Future<Map<String, dynamic>> totpSetup() async {
    try {
      final res = await _client().post("/auth/totp/setup", options: await _authed());
      return Map<String, dynamic>.from(res.data as Map);
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Confirm TOTP enrollment with a code from the authenticator app.
  Future<void> totpEnable(String code) async {
    try {
      await _client().post(
        "/auth/totp/enable",
        data: {"code": code},
        options: await _authed(),
      );
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Recover wallet access on a new device via email + a TOTP code.
  Future<void> totpRecover({required String email, required String code}) async {
    try {
      final res = await _client().post(
        "/auth/totp/recover",
        data: {"email": email, "code": code},
      );
      _token = (res.data as Map)["token"] as String;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Send (or re-send) the email-verification link to the account's email.
  Future<void> requestVerify() async {
    try {
      await _client().post("/auth/request-verify", options: await _authed());
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Start a password reset — the backend emails a reset link. Always succeeds
  /// (never reveals whether the email exists).
  Future<void> forgotPassword(String email) async {
    try {
      await _client().post("/auth/forgot-password", data: {"email": email});
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Revoke every session for this account (server-side) + drop the local token.
  Future<void> logoutAll() async {
    try {
      await _client().post("/auth/logout-all", options: await _authed());
      _token = null;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Permanently delete the account + all its data (POPIA/GDPR).
  Future<void> deleteAccount() async {
    try {
      await _client().post("/auth/delete-account", options: await _authed());
      _token = null;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Authoritative list of linked accounts from the backend.
  Future<List<dynamic>> fetchLinkedAccounts() async {
    try {
      final res = await _client().get("/link/accounts", options: await _authed());
      return (res.data as Map)["accounts"] as List<dynamic>;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  Future<Options> _authed() async =>
      Options(headers: {"Authorization": "Bearer ${await _authToken()}"});

  String _message(DioException e) {
    final data = e.response?.data;
    if (data is Map && data["message"] is String) return data["message"];
    if (data is Map && data["error"] is String) return data["error"];
    return e.message ?? "Network error";
  }

  /// Creates a payment intent on the backend. Returns the raw response, e.g.
  /// `{status: "redirect", payUrl}` (cards) or `{status: "crypto", deposit}`.
  Future<Map<String, dynamic>> createCheckout({
    required String packId,
    required String method,
    required String region,
  }) async {
    try {
      final res = await _client().post(
        "/payments/checkout",
        data: {"packId": packId, "method": method, "region": region},
        options: await _authed(),
      );
      return Map<String, dynamic>.from(res.data as Map);
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Authoritative wallet state from the server (balance, transactions,
  /// supported creators).
  Future<Map<String, dynamic>> fetchWallet() async {
    try {
      final res = await _client().get("/wallet", options: await _authed());
      return Map<String, dynamic>.from(res.data as Map);
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  Future<int> pushSong({
    required String songId,
    required String title,
    required String artist,
    String? artistId,
    String? imageUrl,
    required int tokens,
  }) async {
    try {
      final res = await _client().post(
        "/wallet/push",
        data: {
          "songId": songId,
          "title": title,
          "artist": artist,
          "artistId": artistId,
          "imageUrl": imageUrl,
          "tokens": tokens,
        },
        options: await _authed(),
      );
      return ((res.data as Map)["balance"] as num).toInt();
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  Future<int> supportCreator({
    required String creatorId,
    required String name,
    required int tokens,
  }) async {
    try {
      final res = await _client().post(
        "/wallet/support",
        data: {"creatorId": creatorId, "name": name, "tokens": tokens},
        options: await _authed(),
      );
      return ((res.data as Map)["balance"] as num).toInt();
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Returns the provider OAuth URL the app should open in a browser.
  Future<String> startLinking(String provider) async {
    try {
      final res = await _client().get(
        "/link/$provider/start",
        options: await _authed(),
      );
      return (res.data as Map)["url"] as String;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  Future<List<dynamic>> fetchLeaderboard() async {
    try {
      final res = await _client().get("/leaderboard");
      return (res.data as Map)["entries"] as List<dynamic>;
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// The DeeMusiq catalog (published songs). Returns `{items, nextCursor}`.
  Future<Map<String, dynamic>> fetchCatalog({
    String? cursor,
    String? query,
    int limit = 30,
  }) async {
    try {
      final res = await _client().get("/catalog", queryParameters: {
        if (cursor != null) "cursor": cursor,
        if (query != null && query.isNotEmpty) "q": query,
        "limit": limit,
      });
      return Map<String, dynamic>.from(res.data as Map);
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }

  /// Region-adjusted pricing from the server (authoritative).
  Future<Map<String, dynamic>> fetchPricing(String region) async {
    try {
      final res = await _client().get(
        "/pricing",
        queryParameters: {"region": region},
      );
      return Map<String, dynamic>.from(res.data as Map);
    } on DioException catch (e) {
      throw WalletApiException(_message(e));
    }
  }
}
