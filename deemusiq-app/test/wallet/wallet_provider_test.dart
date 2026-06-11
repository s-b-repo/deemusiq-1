import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deemusiq/models/wallet/linked_account.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/kv_store/kv_store.dart';

// These tests run the notifier fully offline (no DEEMUSIQ_BACKEND_URL is baked
// into test builds), so every mutation goes through the local ledger path.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await KVStoreService.initialize();
    container = ProviderContainer();
    addTearDown(container.dispose);
  });

  WalletNotifier notifier() => container.read(walletProvider.notifier);

  test("starts empty and derives balance from the ledger", () async {
    expect(container.read(walletProvider).balance, 0);
    expect(container.read(walletProvider).transactions, isEmpty);

    await notifier().grantBonus(100);
    await notifier().grantBonus(50, reason: "Promo");

    final state = container.read(walletProvider);
    expect(state.transactions.length, 2);
    expect(state.balance, 150);
    expect(
      state.transactions.fold<int>(0, (sum, tx) => sum + tx.tokens),
      state.balance,
      reason: "balance must always equal the ledger sum",
    );
  });

  test("pushSong debits the ledger and aggregates per song", () async {
    await notifier().grantBonus(100);

    final ok = await notifier().pushSong(
      songId: "song-1",
      title: "Amapiano Sunrise",
      artist: "Dee",
      artistId: "artist-1",
      tokens: 30,
    );
    expect(ok, isTrue);

    var state = container.read(walletProvider);
    expect(state.balance, 70);
    expect(state.pushedSongs.length, 1);
    expect(state.pushedSongs.first.totalTokens, 30);
    expect(state.pushedSongs.first.pushCount, 1);

    // A second push of the same song aggregates instead of duplicating.
    await notifier().pushSong(
      songId: "song-1",
      title: "Amapiano Sunrise",
      artist: "Dee",
      artistId: "artist-1",
      tokens: 20,
    );
    state = container.read(walletProvider);
    expect(state.balance, 50);
    expect(state.pushedSongs.length, 1);
    expect(state.pushedSongs.first.totalTokens, 50);
    expect(state.pushedSongs.first.pushCount, 2);
  });

  test("insufficient balance makes pushSong a no-op", () async {
    await notifier().grantBonus(10);
    final before = container.read(walletProvider);

    final ok = await notifier().pushSong(
      songId: "song-1",
      title: "Too Expensive",
      artist: "Dee",
      tokens: 1000,
    );

    expect(ok, isFalse);
    final after = container.read(walletProvider);
    expect(after.balance, before.balance);
    expect(after.transactions.length, before.transactions.length);
    expect(after.pushedSongs, isEmpty);
  });

  test("zero or negative amounts are rejected", () async {
    await notifier().grantBonus(10);
    expect(
      await notifier().pushSong(
        songId: "s",
        title: "t",
        artist: "a",
        tokens: 0,
      ),
      isFalse,
    );
    expect(
      await notifier().supportCreator(
        creatorId: "c",
        name: "n",
        tokens: -5,
      ),
      isFalse,
    );
    expect(container.read(walletProvider).balance, 10);
  });

  test("supportCreator and pushSong aggregate per creator", () async {
    await notifier().grantBonus(100);

    await notifier().supportCreator(
      creatorId: "artist-1",
      name: "Dee",
      tokens: 25,
    );
    await notifier().pushSong(
      songId: "song-1",
      title: "Track",
      artist: "Dee",
      artistId: "artist-1",
      tokens: 10,
    );
    await notifier().supportCreator(
      creatorId: "artist-2",
      name: "Musiq",
      tokens: 40,
    );

    final state = container.read(walletProvider);
    expect(state.balance, 25);
    expect(state.supportedCreators.length, 2);

    // Most-supported first.
    expect(state.supportedCreators.first.id, "artist-2");
    expect(state.supportedCreators.first.totalTokens, 40);

    final dee = state.supportedCreators.firstWhere((c) => c.id == "artist-1");
    expect(dee.totalTokens, 35);
    expect(dee.contributions, 2);
  });

  test("unlinkAccount removes the local account offline", () async {
    final n = notifier();
    await n.linkAccount(LinkedProvider.spotify, displayName: "dee");
    expect(container.read(walletProvider).linkedAccounts.length, 1);

    await n.unlinkAccount(LinkedProvider.spotify);
    expect(container.read(walletProvider).linkedAccounts, isEmpty);
  });

  test("state persists through SharedPreferences across containers", () async {
    await notifier().grantBonus(75);

    final second = ProviderContainer();
    addTearDown(second.dispose);
    expect(second.read(walletProvider).balance, 75);
  });
}
