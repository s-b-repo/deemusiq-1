import 'package:flutter_test/flutter_test.dart';
import 'package:deemusiq/models/wallet/linked_account.dart';

void main() {
  test("JSON round-trip preserves every field", () {
    final account = LinkedAccount(
      provider: LinkedProvider.tidal,
      displayName: "dee",
      externalId: "u123",
      connectedAt: DateTime.utc(2026, 1, 2, 3, 4, 5),
    );

    final decoded = LinkedAccount.fromJson(account.toJson());

    expect(decoded.provider, LinkedProvider.tidal);
    expect(decoded.displayName, "dee");
    expect(decoded.externalId, "u123");
    expect(decoded.connectedAt, account.connectedAt);
  });

  test("backend-shaped JSON (provider as plain string) parses", () {
    // Mirrors GET /link/accounts: {provider, displayName, externalId, connectedAt}.
    final decoded = LinkedAccount.fromJson({
      "provider": "spotify",
      "displayName": "Dee Musiq",
      "externalId": "sp_42",
      "connectedAt": "2026-06-01T10:00:00.000Z",
    });

    expect(decoded.provider, LinkedProvider.spotify);
    expect(decoded.displayName, "Dee Musiq");
    expect(decoded.externalId, "sp_42");
    expect(decoded.connectedAt.isAfter(DateTime.utc(2026, 5, 31)), isTrue);
  });

  test("unknown provider falls back to spotify", () {
    final decoded = LinkedAccount.fromJson({
      "provider": "soundcloud",
      "displayName": "x",
      "connectedAt": "2026-01-01T00:00:00.000Z",
    });
    expect(decoded.provider, LinkedProvider.spotify);
  });

  test("missing/garbled fields degrade safely", () {
    final decoded = LinkedAccount.fromJson({"provider": "tidal"});
    expect(decoded.provider, LinkedProvider.tidal);
    expect(decoded.displayName, "");
    expect(decoded.externalId, isNull);
    expect(decoded.connectedAt, DateTime.fromMillisecondsSinceEpoch(0));
  });
}
