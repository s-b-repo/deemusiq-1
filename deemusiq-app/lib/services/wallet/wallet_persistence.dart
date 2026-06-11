import 'dart:convert';

import 'package:deemusiq/models/wallet/wallet_state.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';
import 'package:deemusiq/services/logger/logger.dart';

/// Local persistence for the DeeMusiq wallet, backed by the same
/// SharedPreferences instance the rest of the app uses (already initialised at
/// startup via [KVStoreService.initialize]).
///
/// This is intentionally a thin, swappable layer: a backend-backed wallet would
/// implement the same load/save shape against an authenticated API.
abstract class WalletPersistence {
  static const _key = "deemusiq_wallet_v1";

  static WalletState load() {
    try {
      final raw = KVStoreService.sharedPreferences.getString(_key);
      if (raw == null || raw.isEmpty) return const WalletState();
      return WalletState.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (e, stack) {
      AppLogger.reportError(e, stack);
      return const WalletState();
    }
  }

  static Future<void> save(WalletState state) async {
    try {
      await KVStoreService.sharedPreferences.setString(
        _key,
        jsonEncode(state.toJson()),
      );
    } catch (e, stack) {
      AppLogger.reportError(e, stack);
    }
  }
}
