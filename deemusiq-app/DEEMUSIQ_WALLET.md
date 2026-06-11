# DeeMusiq Wallet, Tokens & Account Linkage

This document describes the **DeeMusiq monetisation layer** added on top of the
Spotube engine: a token wallet, "push a song" boosting, creator support, a token
store with **region-based pricing**, multi-service **account linkage**, and a
trending leaderboard.

> **Honest status.** Everything here is **fully working locally** (on-device,
> offline) so it can be demoed today. **No real money moves yet** — the fiat and
> crypto rails are wired behind clean interfaces but need a small backend to
> settle. The seams you must fill to go live are listed below and marked in code.

---

## What's included

| Area | Where (UI) | Where (code) |
|------|-----------|--------------|
| Wallet & balance | `Wallet` sidebar tile, Profile → Wallet | `pages/wallet/wallet.dart` |
| Buy tokens (regional packs) | Wallet → Buy tokens | `pages/wallet/token_store.dart` |
| Pay with card / crypto | Buy flow dialog | `components/wallet/purchase_dialog.dart`, `services/wallet/payment_service.dart` |
| Push a song (boost) | Any track's ⋮ menu → "Push this song" | `components/wallet/push_song_dialog.dart` |
| Creators you support + earnings | Wallet → Creators you support | `pages/wallet/creators_supported.dart` |
| Trending / most-pushed | Wallet → Trending | `pages/wallet/leaderboard.dart` |
| Linked accounts (Spotify, etc.) | Wallet → Linked accounts, Profile | `pages/wallet/linked_accounts.dart` |
| Transaction ledger | Wallet → Recent activity | balance is derived from it |

State is JSON-persisted in `SharedPreferences` (`WalletPersistence`,
key `deemusiq_wallet_v1`). The **balance is always derived from the transaction
ledger**, so it can't drift out of sync.

## Tokens & "pay to push"

- Users buy **tokens** in packs (`models/wallet/token_pack.dart`).
- They spend tokens to **push** a song (boosts it on the trending board and
  records support for the artist) or to **support a creator** directly.
- Every credit/debit is a `TokenTransaction`; the wallet exposes `balance`,
  `totalPurchased`, `totalSpent`.

## Region-based pricing (ZAR base)

DeeMusiq is South-Africa first, so pack prices are authored in **ZAR**
(`TokenPack.basePriceZar`) and localised per region by `RegionTier`
(`models/wallet/region_pricing.dart`):

```
localPrice = baseZAR × pppFactor × fxPerZar
```

- `pppFactor` — purchasing-power adjustment (SA = 1.0).
- `fxPerZar` — approximate FX (local units per 1 ZAR).
- The user's region follows the app's recommendation market, or an explicit
  override picked in the token store.

> ⚠️ `fxPerZar` / `pppFactor` are **static approximations** so the app can price
> offline. In production, fetch **live FX** and resolve **final prices
> server-side** — never trust client-side prices for real charges.

## Payments: what's wired vs. what's needed

`PaymentService` (`services/wallet/payment_service.dart`) abstracts settlement.
The default `DeeMusiqPaymentService` returns:

| Method | Behaviour now | To go live |
|--------|---------------|-----------|
| **Test top-up (demo)** | Credits instantly | — (demo only) |
| **Card — PayFast / Stripe** | "requires backend" | Backend creates a PayFast/Stripe checkout; webhook credits tokens |
| **Monero / Ethereum / Bitcoin / USDT** | "awaiting deposit" | Set a receiving address + a chain **deposit watcher** that credits on confirmation |

Fill these in **`PaymentGatewayConfig`**:

```dart
static const String backendBaseUrl = "";            // your payments backend
static const Map<PaymentMethodKind, String> cryptoAddresses = { ... };  // receiving wallets
```

**Why a backend is non-negotiable:** balances and prices must be authoritative
server-side, card settlement needs a PCI-compliant processor (PayFast for ZA,
Stripe international), and crypto needs an on-chain watcher to confirm deposits.
Client-only balances are trivially forgeable.

## Connecting the backend (makes it real)

A complete, deployable backend lives in **`/backend`** (Node + TypeScript +
Prisma). It is the authoritative wallet, runs the card/crypto checkouts, watches
settlements, and handles OAuth linking. To connect the app to it:

1. Deploy `/backend` (see `backend/README.md` — Docker, Render one-click, or any
   Node host) and note its public URL, e.g. `https://api.deemusiq.co.za`.
2. Set that URL once in the app:
   `lib/services/wallet/payment_service.dart` →
   `PaymentGatewayConfig.backendBaseUrl = "https://api.deemusiq.co.za";`

That single line flips the app from local-demo to backend-backed:

- **Top-ups** go through `WalletApiClient` → backend `/payments/checkout`. Cards
  open the real PayFast/Stripe checkout; crypto shows a real deposit address.
  Tokens are credited by a verified provider webhook — the "Simulate (demo)"
  shortcut disappears automatically for real rails.
- **The wallet page** calls `WalletNotifier.syncFromBackend()` on open, pulling
  the authoritative balance/ledger/supported-creators from `/wallet`.
- The client (`lib/services/wallet/wallet_api.dart`) already implements
  `/pricing`, `/wallet`, `/wallet/push`, `/wallet/support`, `/leaderboard` and
  `/link/:provider/start` — wire `pushSong`/`supportCreator`/leaderboard reads to
  it next so those also become server-authoritative (the local provider is the
  offline cache until then).

With `backendBaseUrl` empty (the default), none of this runs — the app stays
fully local and demoable.

### Backend API (what the app calls)

The full contract lives in [`backend/README.md`](../../backend/README.md). The app
client (`lib/services/wallet/wallet_api.dart`) talks to these endpoints; money and
identity routes carry a device-JWT from `POST /auth/device`:

| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| `POST` | `/auth/device` | – | `{deviceId}` → `{token, userId}` |
| `GET`  | `/pricing?region=ZA` | – | region-adjusted packs + prices |
| `GET`  | `/leaderboard` | – | global most-pushed songs |
| `GET`  | `/wallet` | ✅ | `{balance, transactions, supportedCreators}` |
| `POST` | `/wallet/push` | ✅ | spend tokens to push a song |
| `POST` | `/wallet/support` | ✅ | spend tokens to support a creator |
| `POST` | `/payments/checkout` | ✅ | `{packId, method, region?}` → card `payUrl` or crypto `deposit` |
| `GET`  | `/link/:provider/start` | ✅ | returns the provider OAuth URL to open |
| `POST` | `/webhooks/{stripe,payfast,crypto}` | provider-signed | credit tokens on confirmed settlement |

Tokens are credited **only** by a verified provider webhook — never by the client.

## Account linkage

`LinkedProvider` (`models/wallet/linked_account.dart`) supports Spotify (first),
YouTube Music, Apple Music, Deezer and TIDAL. The connect flow stores the public
handle today. To make it real:

1. Register an OAuth client with each provider.
2. Implement the provider's OAuth (PKCE) flow.
3. Store tokens in the app's **existing encrypted store** (it already has an
   `EncryptedTextConverter` used by the auth table), not in plain prefs.

## Notes / nuances handled

- Balance derived from the ledger (no desync); insufficient-balance pushes are
  rejected, not allowed to go negative.
- Region override persists; prices update live across the store and dialogs.
- Crypto deposit screen shows "address not configured" until you set wallets,
  instead of pretending to accept funds.
- Brand fidelity uses **colour** (Spotify green, BTC orange, etc.) rather than
  third-party brand-icon packs, to keep the build dependency-free.
- All amounts/timestamps use real `DateTime`; nothing is faked in the ledger.

## Removing the feature

It's self-contained under `models/wallet/`, `services/wallet/`,
`provider/wallet/`, `pages/wallet/`, `components/wallet/`. Removing those plus the
five `wallet/*` routes in `collections/routes.dart`, the sidebar tile in
`collections/side_bar_tiles.dart`, the profile cards, and the "Push this song"
item in `components/track_tile/track_options.dart` fully reverts it.
