import 'package:flutter_test/flutter_test.dart';
import 'package:deemusiq/models/wallet/payment_method.dart';
import 'package:deemusiq/models/wallet/region_pricing.dart';
import 'package:deemusiq/models/wallet/token_pack.dart';
import 'package:deemusiq/services/wallet/payment_service.dart';

void main() {
  const service = DeeMusiqPaymentService();
  final pack = TokenPack.all.first;

  test("test runs are offline builds (no backend URL baked in)", () {
    expect(PaymentGatewayConfig.backendBaseUrl, isEmpty);
  });

  test("without a backend every real rail requires the backend", () async {
    for (final method in PaymentMethodKind.topUpMethods) {
      final res = await service.purchase(
        pack: pack,
        region: RegionTier.za,
        method: method,
      );
      expect(res.status, PaymentStatus.requiresBackend,
          reason: "method ${method.name} must route to the backend");
      expect(res.creditedTokens, 0,
          reason: "offline purchases must never credit tokens");
      expect(res.allowSimulate, isFalse,
          reason: "no fake-credit affordance for real rails");
      expect(res.actionUrl, isNull);
      expect(res.deposit, isNull);
      expect(res.reference, startsWith("DM-"));
    }
  });

  test("demo credit cannot mint tokens offline", () async {
    final res = await service.purchase(
      pack: pack,
      region: RegionTier.za,
      method: PaymentMethodKind.demoCredit,
    );
    // The offline gate fires before the demo-credit branch: tokens are bought
    // online only, so even the demo method routes to the backend message.
    expect(res.status, PaymentStatus.requiresBackend);
    expect(res.creditedTokens, 0);
    expect(res.allowSimulate, isFalse);
  });
}
