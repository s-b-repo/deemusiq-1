import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/provider/wallet/leaderboard_provider.dart';
import 'package:deemusiq/provider/wallet/server_pricing_provider.dart';

// Offline (no DEEMUSIQ_BACKEND_URL in test builds) both online providers must
// resolve immediately to their fallback values without touching the network.
void main() {
  test("leaderboard is empty when no backend is configured", () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final entries = await container.read(leaderboardProvider.future);
    expect(entries, isEmpty);
  });

  test("server pricing is null (local fallback) when offline", () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final pricing = await container.read(serverPricingProvider.future);
    expect(pricing, isNull);
  });

  test("LeaderboardEntry parses the backend entry JSON", () {
    final entry = LeaderboardEntry.fromJson({
      "rank": 3,
      "songId": "song-9",
      "title": "Heat",
      "artist": "Dee",
      "artistId": null,
      "imageUrl": null,
      "totalTokens": 120,
      "pushCount": 7,
    });

    expect(entry.rank, 3);
    expect(entry.songId, "song-9");
    expect(entry.title, "Heat");
    expect(entry.artist, "Dee");
    expect(entry.artistId, isNull);
    expect(entry.imageUrl, isNull);
    expect(entry.totalTokens, 120);
    expect(entry.pushCount, 7);
  });

  test("ServerPricedPack parses the backend PricedPack JSON", () {
    final priced = ServerPricedPack.fromJson({
      "id": "starter",
      "label": "Starter",
      "tokens": 50,
      "bonusTokens": 0,
      "basePriceZar": 29,
      "popular": false,
      "totalTokens": 50,
      "currencyCode": "ZAR",
      "currencySymbol": "R",
      "price": 29,
      "priceMinor": 2900,
      "priceLabel": "R29.00",
    });

    expect(priced.pack.id, "starter");
    expect(priced.pack.totalTokens, 50);
    expect(priced.price, 29.0);
    expect(priced.priceLabel, "R29.00");
    expect(priced.currencyCode, "ZAR");
  });
}
