# Changelog

All notable changes to the DeeMusiq project (website + rebranded app) are recorded here.
Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### 2026-06-09 — Backend bug fixes (error handling: provider outages & missing rows no longer 500)

#### Fixed
- **Prisma exceptions no longer masked as `500`** (`src/index.ts`). The central
  error handler now maps `PrismaClientKnownRequestError` codes to proper HTTP
  status: `P2025` (record not found) → **404**, `P2002` (unique constraint, e.g.
  two devices registering the same email) → **409**, `P2003` (foreign key) →
  **400**, and `PrismaClientValidationError` → **400**. One change fixes four
  routes that previously leaked 500s on a missing/duplicate row: catalog
  `PUT`/`DELETE /catalog/:id`, the `/auth/register` email race, `/auth/verify`,
  and `/auth/reset-password`. *(Verified live: missing-song PUT/DELETE now 404.)*
- **OAuth callback returned a raw JSON 500 to the browser** (`src/routes/linking.ts`).
  The provider token exchange (`p.exchange(code)`) is a network call that can fail
  (timeout / revoked code / provider 5xx); it now renders the styled "couldn't
  connect" landing page instead of an error-handler JSON 500.
- **Crypto (NOWPayments) outage → opaque 500 + orphaned pending intent**
  (`src/providers/crypto.ts`). The deposit call had no error handling and threw
  *after* a `PaymentIntent` was already created. It now catches outages/timeouts
  (and a 200 with no `pay_address`), falling back to a configured static address
  or the existing graceful `"unavailable"` response; success-shape parsing is
  null-safe.
- **Stripe outage → opaque 500** (`src/routes/payments.ts`). `createStripeCheckout`
  failures now return a clean `502 {status:"unavailable", message:"Card checkout
  is temporarily unavailable…"}` instead of a 500 (PayFast's URL builder is pure,
  so it was unaffected).

All backend, `tsc`-clean, and boot-tested (`/health`, `/catalog`, `/auth/login`
unchanged). No Flutter changes this pass.

### 2026-06-08 — Backend defensive hardening (no-HTTPS transport, breach-resistant secrets, honeypot/tarpit)

#### Transport (operator can't terminate TLS)
- **Cloudflare Tunnel** (`cloudflared`) sidecar gives an HTTPS edge with no certs
  and no open ports; the `api` container moves to an internal-only Docker network
  (`docker-compose.yml`). The AES-256-GCM secure channel stays on end-to-end, so
  Cloudflare only ever sees ciphertext bodies. Cloudflare caching is for public,
  non-encrypted GETs only. See `backend/DEPLOY_TUNNEL.md`.

#### Secrets survive a host compromise
- Vault/OpenBao sealing now uses **AppRole** (short-lived, auto-renewed tokens)
  with a **least-privilege Transit policy** (encrypt/decrypt only — no key export)
  in `backend/vault/`. A breached backend can't exfiltrate key material or decrypt
  after rotation/revocation. Optional **KV v2** hydration moves `JWT_SECRET` +
  payment keys off the host's env (`src/util/secrets.ts`, `initVault()`).

#### Defensive honeypot + tarpit (no offensive/hack-back)
- Honeypot routes (`/wp-admin`, `/.env`, …) log the IP (fail2ban-parseable),
  add it to an auto-**blocklist** (slow 403 thereafter), and **tarpit** the
  response (`src/middleware/{honeypot,blocklist}.ts`). `endlessh` sidecars tarpit
  SSH/telnet (`:22`/`:23`). A tight rate-limiter guards `/auth/*` against
  brute-force. Optional `fail2ban` jail in `backend/deploy/fail2ban/`.
- **Explicitly excluded:** any retaliatory/outbound attack or DoS of connectors —
  illegal under **South Africa's Cybercrimes Act 19 of 2020** (no hack-back
  exemption); replaced by passive trapping that only wastes the attacker's own
  resources on our server.

#### Misc
- Decoy `GET /robots.txt` (backend) + updated `deemusiq-site/robots.txt` (disallow
  all real paths, misdirect to cloudflare/google).
- Loud boot warnings for every weak/default/empty secret (incl.
  `VAULT_TRANSIT_KEY=deemusiq`) and a production hard-fail on a placeholder
  `JWT_SECRET`; "Secrets you MUST change" table + `«CHANGE ME»` markers in
  `.env.example`/README.

### 2026-06-08 — Full `spotube`→`deemusiq` rename + proper-secure auth system

#### Rebrand — `spotube` naming removed
- **Dart package renamed** `spotube` → `deemusiq`: `pubspec.yaml` name + all 1695
  `package:spotube/…` imports across 309 files.
- **All `Spotube*` identifiers renamed** to `DeeMusiq*` (1995 refs incl. freezed
  /generated code, `SpotubeIcons`→`DeeMusiqIcons`, model objects, routes) and
  brand strings in l10n `.arb` values. Files `spotube_icons.dart` /
  `spotube_navigation_bar.dart` → `deemusiq_*`.
- **Left intentionally** (functional/external contracts): native bundle ids
  (`oss.krtirtho.spotube`, `com.github.KRTirtho.Spotube`), plugin discovery
  (`spotube-plugin-*`, `spotube-metadata-plugin` topics), vendored
  `hetu_spotube_plugin`, upstream attribution URLs.

#### Proper-secure auth (backend — no backwards compatibility, fully tested)
- **Device identity: Ed25519 challenge–response.** Each install holds an Ed25519
  keypair; the private key lives in the secure enclave (Keystore/Keychain) and
  NEVER leaves the device. Backend stores only the public key (TOFU) and verifies
  a signature over a short-lived server challenge. Replaces the guessable
  device-id login. `POST /auth/device/challenge` + `/auth/device/login`.
- **Email + password.** `POST /auth/register` (attach to wallet) + `/auth/login`.
  Passwords are **one-way scrypt-hashed** (`scrypt$N$r$p$salt$hash`) — never
  stored, even encrypted.
- **TOTP (RFC 6238) 2FA + recovery**, compatible with any authenticator app
  (verified against the RFC test vectors). `/auth/totp/{setup,enable,recover}`;
  setup returns an `otpauth://` URI for the in-app QR.
- **At-rest secrets via a FOSS vault.** TOTP secrets/OAuth tokens are sealed
  through **HashiCorp Vault / OpenBao Transit** (keys never leave the vault) when
  `VAULT_ADDR`/`VAULT_TOKEN` are set, else local AES-256-GCM — and the server
  **refuses to store a secret in the clear** if neither is configured.
- App wired to the new flow: `cryptography` Ed25519 keypair
  (`device_identity.dart`), challenge-response in `wallet_api`, and email/TOTP
  client methods; linked accounts now pulled from the backend in `syncFromBackend`.

### 2026-06-08 — New logo everywhere + backend-connected online mode

Propagated the new DeeMusiq logo across every surface and switched the wallet /
payments / account / downloads to a backend-required ("online") model with
encrypted-in-transit traffic and South-Africa-only payments.

#### Branding — new `logo.png` (1024×1024) propagated from a single master
- **App icons regenerated for every platform** (main + nightly flavors): Android
  legacy mipmaps + adaptive foreground/background + splash + Android-12 splash,
  iOS `AppIcon` set (flattened — **no alpha**, App-Store-safe), macOS `AppIcon`,
  web icons (incl. maskable) + favicon, Windows multi-size `.ico`, and the four
  `deemusiq-logo*` branding sources. Solid icon backgrounds use brand dark
  `#1a1512`. 215 icon files verified (correct dimensions, no corruption).
- **Website**: `assets/img/logo.png` (now 256px), `favicon-32`, `apple-touch-icon`,
  multi-size `favicon.ico`, and a new `og-image.png` (1200×630) — all from the
  new logo. Site/social/canonical URLs corrected to
  **`https://deemusiq.github.io/deemusiq/`**; the in-app About "Website" link now
  points there too (was the upstream author's domain).

#### Online mode — the backend is now the source of truth
- **App ↔ backend wiring.** `PaymentGatewayConfig.backendBaseUrl` /
  `secureChannelKey` are set at build time via
  `--dart-define=DEEMUSIQ_BACKEND_URL=...` / `DEEMUSIQ_CHANNEL_KEY=...` (raw
  `http://IP:port` is fine — see encryption below). `WalletApiClient.ping()`
  probes `/health` as the single online gate.
- **Quantum-resistant in-transit encryption ("secure channel").** Opt-in AES-256-GCM
  envelope (`{v,iv,ct}`, tag-appended) over a **pre-shared 256-bit key**, so every
  request/response body is encrypted even on plain HTTP. Quantum-safe by design:
  no RSA/ECDH handshake to break (Shor's), AES-256 holds ~128-bit vs Grover's.
  App `lib/services/wallet/secure_channel.dart` (reuses `encrypt`, no new dep) +
  Dio interceptor; backend `util/secureChannel.ts` middleware (`SECURE_CHANNEL_KEY`).
  Round-trip + GCM tamper-rejection verified on the backend.
- **Downloads are online-only.** `download_manager_provider` checks backend
  reachability before queuing; offline → a clear toast and no new downloads, while
  already-downloaded songs keep playing. Streaming online songs (YouTube engine) is
  unaffected by backend reachability.
- **Token top-ups are online-only.** Removed local/demo crediting from
  `DeeMusiqPaymentService.purchase` (no `allowSimulate`, no instant `demoCredit`);
  the `demoCredit` method is dropped from the store's offered methods. The backend
  webhook remains the only path that credits a wallet.

#### Payments — South Africa only
- Backend rejects non-ZA checkouts when `PAYMENTS_ZA_ONLY=true` (default) — no
  `PaymentIntent` created, no provider contacted.
- App locks pricing to ZAR (`regionTierProvider` → `RegionTier.za`,
  `PaymentGatewayConfig.paymentsZaOnly`) and the token store shows an SA-only notice
  instead of a region picker.

#### Deep links
- `deemusiq://` is now handled (`use_deep_linking.dart`, previously deprecated/empty):
  the backend's post-payment / post-link redirect refreshes wallet state and opens
  the Wallet / Linked-accounts screen. Android manifest scheme renamed
  `spotube` → `deemusiq` to match the backend's `APP_DEEP_LINK`.

#### Backend security (earlier in the day)
- NOWPayments IPN now validates amount/currency against the intent; JWT pinned to
  HS256 + `sub` validation; Stripe checkout idempotency key; insecure-default
  startup warnings.

### 2026-06-08 — Docs / CHANGELOG / CI consolidation pass

Documentation and build-pipeline cleanup across the monorepo's DeeMusiq-authored
areas (app docs/CI, root docs). No app/site/backend source behaviour changed.

#### Added
- **App CHANGELOG now records the DeeMusiq fork.** `deemusiq-app/CHANGELOG.md` was the
  raw upstream Spotube changelog with no DeeMusiq history; prepended a DeeMusiq section
  (rebrand → wallet → backend, app `5.1.2+45`) above the **preserved, unchanged**
  upstream Spotube release history (credited to Kingkor Roy Tirtho & contributors).
- **Backend API pointer in `DEEMUSIQ_WALLET.md`.** Added a concise "Backend API"
  endpoint table (verified against `backend/src/index.ts` + `backend/README.md`):
  `/auth/device`, `/pricing`, `/wallet`(+`/push`,`/support`), `/payments/checkout`,
  `/link/:provider/start`, `/leaderboard`, `/webhooks/{stripe,payfast,crypto}`.

#### Changed / hardened
- **Root `.gitignore` no longer relies solely on the backend's nested ignore.** Added
  root-level rules for `backend/node_modules/`, `backend/dist/`, `backend/data/`,
  `backend/*.db*` and `node_modules/` / `dist/` anywhere. **Fixed a real gap:** the
  root file ignored `*.env` but not a bare `.env`, so a stray `backend/.env` could have
  been committed if added from the repo root; now `.env` / `.env.*` are ignored with a
  `!.env.example` exception so the template stays tracked.

#### CI/CD — verified (read both `deemusiq-android.yml` workflows; no fix needed)
- **FVM/Flutter pin matches.** Both workflows pin `FLUTTER_VERSION 3.35.2` (channel
  `master`), matching `deemusiq-app/.fvmrc` (`"flutter": "3.35.2"`).
- **APK selection is correct and deterministic.** `--flavor stable` matches the
  `stable` product flavor in `android/app/build.gradle` (no `applicationIdSuffix`, so
  `za.co.deemusiq.app`), producing `app-stable-release.apk` — the primary `find`
  selector — with `*-release.apk` → `*.apk` fallbacks and a loud `::error::`/`exit 1`.
- **Paths are right for the layout.** The root workflow sets
  `working-directory: deemusiq-app` and uploads `deemusiq-app/dist/DeeMusiq.apk`; the
  nested (`deemusiq-app/.github/`) workflow assumes an app-rooted repo and uploads
  `dist/DeeMusiq.apk`. Both internally consistent.
- **No double-build in the monorepo.** GitHub Actions only auto-discovers workflows
  under the **root** `.github/workflows/`, so the nested copy does **not** run here — it
  exists for the documented "upload just the `deemusiq-app/` folder to its own repo"
  path (`README.DEEMUSIQ.md`). Added a header comment to each workflow explaining the
  dual-workflow design so a future maintainer doesn't "reconcile" a non-conflict.
- **No stray `spotube` artifact/path names** in either workflow; the one "Spotube"
  mention is a legitimate code comment crediting upstream's `cli.dart` helper.



Added a complete, **deployable** backend in **`/backend`** that makes the wallet
real, and wired the app to use it when configured. **Verified locally:** it
typechecks (`tsc` clean), boots, and all endpoints work end-to-end against SQLite
(auth → pricing → wallet → push/support → leaderboard, plus the not-configured
fallbacks). No real money moves until you add provider keys.

#### Added — `/backend` (Node + TypeScript + Express + Prisma)
- **Authoritative wallet ledger** (balance = sum of an append-only ledger; spends
  are transaction-guarded against going negative — confirmed via live test).
- **Server-authoritative region pricing** (`/pricing`) mirroring the app's ZAR
  tiers, with optional live FX. Verified: ZA→`R29.00`, US→`$3.45`, etc.
- **Card checkout + webhooks:** Stripe (Checkout + signed webhook) and PayFast
  (signed redirect + ITN validation with server postback + amount check).
- **Crypto deposits:** NOWPayments (XMR/ETH/BTC/USDT) invoice + HMAC-verified IPN,
  with a static-address fallback. Tokens credited only on confirmed settlement.
- **Account-linkage OAuth:** Spotify implemented (authorize → token exchange →
  profile → encrypted store), generic registry for the other providers.
- **Global most-pushed leaderboard** + supported-creators aggregation across users.
- **Device-JWT auth**, AES-256-GCM encryption for stored tokens, rate limiting,
  raw-body capture for webhook signature verification, central error handling.
- **Deploy kit:** `Dockerfile`, `docker-compose.yml`, `render.yaml` (one-click),
  `.env.example`, and `README.md` with the full API contract + go-live steps.

#### Changed — app prepared to talk to the backend (non-breaking)
- New `lib/services/wallet/wallet_api.dart` — a Dio client (device-JWT auth)
  covering pricing, wallet, push/support, checkout, linking, leaderboard.
- `payment_service.dart` now routes real top-ups through the backend when
  `PaymentGatewayConfig.backendBaseUrl` is set (cards open the real checkout URL;
  crypto shows a real deposit address). The "Simulate (demo)" shortcut is hidden
  for real rails so a user can't fake-credit a real wallet.
- Wallet page calls `WalletNotifier.syncFromBackend()` on open to pull
  authoritative state. **All inert when `backendBaseUrl` is empty (the default)**,
  so the app still builds and demos fully offline. Setup: `deemusiq-app/DEEMUSIQ_WALLET.md`.

### 2026-06-05 — Feature: DeeMusiq Wallet, tokens, "pay to push" & account linkage

A full monetisation + account-linkage layer on top of the Spotube engine. Built
**local-first and fully demoable now**; real money settlement is wired behind clean
interfaces that need a small backend to go live (documented in
`deemusiq-app/DEEMUSIQ_WALLET.md`).

#### Added
- **Token wallet & balance.** On-device wallet whose balance is derived from an
  immutable transaction ledger (can't desync). New `Wallet` sidebar tile + entry
  cards on the Profile page.
- **"Pay to push" your favourite songs.** A "Push this song" action on every
  track's ⋮ menu spends tokens to boost a song; pushes feed a **Trending /
  most-pushed leaderboard**.
- **Token store with regional pricing.** Packs are authored in **ZAR** (SA-first)
  and localised per region via purchasing-power tiers derived from `markets.dart`
  (`R`, `$`, `£`, `₦`, `KSh`, `₹`…), with a region override picker.
- **Payments — cards + crypto.** A `PaymentService` abstraction with PayFast/Stripe
  card rails and **Monero, Ethereum, Bitcoin and USDT** crypto rails. Card/crypto
  show their real settlement path (and a clearly-labelled "Test top-up (demo)" that
  credits instantly so the wallet works offline). Going live = set
  `PaymentGatewayConfig` (backend URL + receiving wallets).
- **Account linkage to online services.** A generic "Linked accounts" system with
  **Spotify** first and slots for YouTube Music / Apple Music / Deezer / TIDAL.
- **Creators you support + earnings view.** Aggregates tokens you've sent each
  artist (via pushes and direct support) with a share breakdown; "Support more"
  flow. **User info** surfaced on the profile alongside wallet + linked accounts.
- **Transaction activity** feed on the wallet (top-ups, pushes, supports, bonuses).

#### Nuances handled
- Insufficient-balance pushes are rejected (no negative balances); region changes
  re-price the whole store live; crypto screen says "address not configured" rather
  than pretending to accept funds; brand colours (Spotify green, BTC orange, …)
  give fidelity without adding brand-icon dependencies; all amounts/timestamps are
  real (nothing faked in the ledger).

#### Honest status
- **No real money moves yet.** Secure balances/prices and card + crypto settlement
  require a backend (authoritative pricing, PCI processor, on-chain deposit
  watcher); real Spotify/other linkage needs each provider's OAuth client. The app
  builds, runs and demos the full UX today. See `deemusiq-app/DEEMUSIQ_WALLET.md`.
- New code is self-contained under `lib/{models,services,provider,pages,components}/wallet/`;
  `routes.gr.dart` is regenerated by the CI `build_runner` step (don't build without it).

### 2026-06-05 — Code audit pass #4 (bug hunt alongside the upstream sync)

Three parallel deep-audits (website, app rebrand integrity, CI) ran with the upstream
sync. One **critical** build-blocker was found and fixed; the rest were verified or
small rebrand-completeness fixes.

#### Fixed
- **CRITICAL — CI build would fail before producing any APK.** `lib/collections/env.dart`
  is annotated `@Envied(requireEnvFile: true, path: ".env")`, so `build_runner` aborts
  if `.env` is missing — and `.env` is git-ignored / never created, and `env.g.dart`
  isn't committed. The build had no way to succeed on a clean checkout. Added a
  **"Create .env"** step (before `build_runner`) to **both** workflows that writes `.env`
  from optional `LASTFM_API_KEY` / `LASTFM_API_SECRET` secrets (empty is fine — scrobbling
  just stays off) plus `RELEASE_CHANNEL=stable`. Secrets are passed via `env:` (not
  interpolated into the script body) per Actions injection-hardening guidance.
- **User-facing "Spotube" on the shipped Android notification.** The media-playback
  notification channel was named `Spotube` / `Spotube Media Controls`
  (`audio_services.dart:36,39`) — visible in the player notification and Android settings.
  Renamed to **DeeMusiq** / **DeeMusiq Media Controls**.
- **Desktop user-facing "Spotube" leftovers** (completes the rebrand's "every place a
  user sees Spotube now says DeeMusiq" contract): system-tray background notification
  title (`use_close_behavior.dart:15`) and the plugin file-picker label
  (`metadata_plugins.dart:197`) → **DeeMusiq**.

#### Improved
- **CI hardening:** added a `concurrency` group with `cancel-in-progress` to both
  workflows so superseded/overlapping runs are cancelled instead of piling up.

#### Verified (no change — would have been wrong to "fix")
- **Flutter channel stays `master` @ `3.35.2`.** An audit suggested switching to
  `stable`; checked upstream Spotube's own release workflow — it uses *exactly*
  `FLUTTER_VERSION 3.35.2` + `FLUTTER_CHANNEL master`. Matching the known-good upstream
  config; left unchanged.
- **`spotube://` OAuth deep-link scheme intact**, `app_name_en`→"DeeMusiq" resolves for
  the `stable` flavor, all icon/splash assets referenced by the generators exist on disk,
  and the 30 `.arb` localization sources are valid JSON with intact placeholders.
- **Website**: no broken links/anchors, all assets resolve, contact details are
  consistent (`deemusiq@protonmail.com` / `+27 73 725 3454`), no personal email leaked.

#### Noted but intentionally NOT changed (out of the Android-only scope)
- macOS DMG packaging (`appdmg.json`, `Makefile`) still uses upstream `Spotube.app` /
  artifact names — irrelevant until a desktop build workflow is added, and a partial
  rebrand there would create inconsistency. Tracked for the desktop-packaging task.
- `lib/l10n/generated/*.dart` still read "Spotube" but are **regenerated** from the clean
  `.arb` sources during the build, so they self-correct (not hand-edited).
- Website Open-Graph image uses a relative URL — needs the final public domain before an
  absolute `og:image` / `og:url` / Twitter-card can be set correctly.

### 2026-06-05 — Upstream sync: Spotube 5.1.1 → 5.1.2 (app `5.1.2+45`)

Pulled the three upstream bug fixes released today in
[Spotube v5.1.2](https://github.com/KRTirtho/spotube/compare/v5.1.1...v5.1.2) and
applied them to the rebranded engine, preserving all DeeMusiq branding.

#### Fixed (ported from upstream)
- **Playback could fail on tracks with no audio-only stream.**
  `newpipe_engine.dart` now falls back to muxed (video+audio) streams when YouTube
  returns no audio-only stream, instead of handing back an empty manifest. Added
  `_parseVideoStream(...)` and the fallback in both `getStreamManifest` and
  `getVideoWithStreamInfo`.
- **Search keyboard wouldn't dismiss / dropdown jank.**
  `search.dart` now calls `focusNode.unfocus()` on submit and moves the `focusNode`
  onto the `TextField` (dropping the `KeyboardListener` wrapper), so the on-screen
  keyboard closes when you submit a search.
- **Custom-image helper could throw on null widths.**
  `models/metadata/image.dart` sort is now null-safe (`(a.width ?? 0)`), preventing a
  crash when an image object reports no width.

#### Changed
- **Version bumped `5.1.1+44` → `5.1.2+45`** (`pubspec.yaml`).
- **Dependencies** synced to upstream 5.1.2: `youtube_explode_dart ^3.0.5 → ^3.1.0`,
  `data_widget 0.0.2 → 0.0.3` (transitive), `flutter_new_pipe_extractor` ref bumped,
  `shadcn_flutter` pinned to `0.0.47`, `test` relaxed to `any`. `pubspec.lock` updated
  to match so CI builds are reproducible.

#### DeeMusiq improvement (on-brand)
- Search placeholder suggestions changed from upstream's Western artists
  (Twenty One Pilots / Linkin Park / d4vd) to South-African artists available in the
  Spotify metadata catalogue (**Tyla, Kabza De Small, Black Coffee**) — fits the
  African-music focus while still resolving real search results.

### 2026-06-05 — Code audit pass #3 (applicationId blast-radius + CSS robustness)

#### Fixed
- **Gradient headlines could render invisible on browsers without `background-clip:text`.**
  `.hero__title .hl` ("drop day.") and `.stat b` set `-webkit-text-fill-color:transparent`
  with no fallback, so an unsupported browser would show transparent glyphs. Added an
  `@supports not (… background-clip:text)` rule restoring solid orange text. (`css/styles.css`)

#### Verified (changing an Android applicationId is a classic rebrand footgun — checked the blast radius)
- **No Firebase** (`google-services.json` absent) → no package-name build mismatch.
- **OAuth/deep-link scheme is `spotube://`, unchanged and platform-consistent** (Android
  intent-filter; iOS/macOS declare no extra scheme). Only `applicationId` changed
  (`za.co.deemusiq.app`), so Spotify login redirects still resolve. No stray `deemusiq://`
  scheme was introduced anywhere — a half-rename there would silently break login.
- **`namespace` + all Kotlin packages stayed `oss.krtirtho.spotube`** (MainActivity, the
  home-screen "glance" widget classes, proguard `-keepnames`) — internally consistent;
  AGP permits `applicationId ≠ namespace`, so the build is unaffected.

### 2026-06-05 — Code audit pass #2 (rebrand integrity + crash-path verification)

Went deeper into the files the rebrand touched. **No new fixes required** — all edits
are structurally valid and the one risky Dart change is confirmed safe (not assumed).

#### Verified
- **All 30 localization `.arb` files still parse as valid JSON** after the blanket
  `Spotube`→`DeeMusiq` value replacement (l10n keys are lowercase `spotube`, untouched).
- **`pubspec.yaml` and `flutter_launcher_icons.yaml` parse as valid YAML**; the four
  edited iOS `*.plist` files are well-formed XML.
- **Accent-colour default is NOT a crash path** (this was a genuine concern).
  `SpotubeColor(0xFFFF5722, …)` is type-valid (`SpotubeColor extends Color`, int arg).
  The picker's `firstWhere` (`color_scheme_picker_dialog.dart:109`) iterates the
  palette's *own* elements, so it always matches; the active-swatch lookup uses
  `firstWhereOrNull` (null-safe). Worst case: no preset pre-highlighted — cosmetic.
- **Website structure**: no duplicate `id`s, no dangling `#anchor` links, balanced
  `section`/`form`/`main`/`header`/`footer` tags.

### 2026-06-05 — Code audit pass #1 (bugs / unsafe handling / CI robustness)

Scope: the DeeMusiq-authored code — the website (`deemusiq-site/`), the CI
workflows, and the rebrand edits. The upstream **Spotube** engine inside
`deemusiq-app/lib/` is third-party (BSD-4-Clause) and was **not** audited here.

#### Fixed
- **Contact form always sent a blank name (real bug).**
  `deemusiq-site/js/main.js` read the name field via `form.name`, which resolves
  to the form element's own `name` attribute (empty), not `<input name="name">`.
  Result: every submitted email had an empty *Name* and a dangling subject line.
  Now reads all fields via `form.elements.namedItem(...)`. The other fields
  (`email`/`topic`/`message`) worked only by accident (no same-named property on
  `HTMLFormElement`) and were made explicit too.
- **CI could grab the wrong APK / fail silently.**
  Both `deemusiq-android.yml` workflows selected the APK with
  `find … -name "*-stable-release.apk" -o -name "*.apk" | head -1`, whose result
  depends on filesystem ordering and could pick an unintended APK. Replaced with
  a deterministic preference (`app-stable-release.apk` → `*-release.apk` → `*.apk`)
  using `-print -quit`, plus an explicit `::error::` + `exit 1` if no APK is found,
  so a broken build fails loudly instead of uploading nothing.

#### Verified (no change needed)
- Contact form builds its `mailto:` with `encodeURIComponent()` on subject/body —
  no injection vector; the site reflects no user input into the DOM.
- GitHub Actions secrets are passed via `env:` (not interpolated into `run:`), and
  `github.ref_name` appears only in release `name`/`body` — no command-injection path.
- Download buttons degrade gracefully: empty `DOWNLOADS` entries route to the
  contact form; `href="#contact"` is a no-JS fallback.
- Static site — no server, no OOM/back-pressure surface; count-up animation is
  bounded by `requestAnimationFrame` over a fixed 1s.

#### Known / cosmetic (tracked, not blocking)
- The in-app accent default was set to DeeMusiq orange (`0xFFFF5722`) with a custom
  name; the settings colour-picker may not highlight it as a preset selection. UI-only.
- The app's data directory was renamed `Spotube` → `DeeMusiq`; on a device that had
  the original Spotube installed this would not migrate old data. Irrelevant for a
  fresh install.

#### Not audited
- Upstream Spotube engine (`deemusiq-app/lib/**`, 270+ files) — third-party code.
  Only user-facing branding strings in it were changed during the rebrand.

---

### 2026-06-04/05 — Initial delivery
- Added `deemusiq-site/` — static, responsive GitHub-Pages website (dark honeycomb
  theme, brand orange `#FF5722`, contact details from the client concept doc).
- Added `deemusiq-app/` — Spotube rebranded to **DeeMusiq** across all platforms
  (display name, app id `za.co.deemusiq.app`, icon/splash, accent colour), with a
  GitHub Actions workflow that builds the Android APK. Attribution kept in `NOTICE.md`.
- Published everything to a private GitHub repo.
