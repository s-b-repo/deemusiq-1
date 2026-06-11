# DeeMusiq — App (rebranded Spotube)

> *It's a drop day.* This folder is the **DeeMusiq Android/desktop app**, a rebrand of the
> open-source [Spotube](https://github.com/KRTirtho/spotube) engine (BSD-4-Clause — see
> [`NOTICE.md`](./NOTICE.md)).

**Heads-up (honest status):** the source has been fully rebranded to DeeMusiq, but the
actual installable file (`.apk`) is **built in the cloud by GitHub Actions** — not on this
machine (Flutter isn't installed here, and Spotube is a large Flutter app). You don't need
to install anything: push this folder to GitHub and click one button. ⬇️

---

## 🟢 Build the DeeMusiq APK (no coding, ~15–25 min in the cloud)

1. Create a **free** GitHub account at <https://github.com> if you don't have one.
2. Make a new repository, e.g. `deemusiq-app` (Public or Private both work).
3. Upload **everything in this `deemusiq-app` folder** to it (drag-and-drop on the repo
   page → *uploading an existing file*), and **Commit**.
4. Open the **Actions** tab → enable workflows if prompted →
   pick **“Build DeeMusiq (Android APK)”** → **Run workflow**.
5. Wait for the green tick. Open the finished run → **Artifacts** → download
   **`DeeMusiq-apk`**. Inside is **`DeeMusiq.apk`**.
6. Send that APK to an Android phone, tap it, allow “install from unknown sources”. Done. 🎉

### Make it a public download (auto-attached to a Release)
Instead of step 4, create a **tag** named `v1.0.0` (repo → Releases → Draft a new release →
choose a tag `v1.0.0` → Publish). The workflow runs automatically and attaches
`DeeMusiq.apk` to that Release. The public download link is then:

```
https://github.com/s-b-repo/deemusiq/releases/latest/download/DeeMusiq.apk
```

The website (`deemusiq-site/js/main.js` → `DOWNLOADS.android`) already points at
this link — it goes live the moment the first `v*` release is published.

---

## 🔐 Signing (important before you go public)

The first build auto-creates a **temporary** signing key so the APK installs immediately
for testing. For a real public release, set a **permanent** keystore so that future updates
install over older versions. One-time setup:

1. On any computer with Java, create a keystore:
   ```bash
   keytool -genkeypair -v -keystore deemusiq.jks -keyalg RSA -keysize 2048 \
     -validity 10000 -alias deemusiq \
     -dname "CN=DeeMusiq, O=The Dembe Group, C=ZA"
   ```
   (it asks you to set a password — remember it)
2. Turn it into text: `base64 -w0 deemusiq.jks > keystore.txt`
3. In your GitHub repo → **Settings → Secrets and variables → Actions → New secret**, add:
   | Secret name | Value |
   |-------------|-------|
   | `KEYSTORE_BASE64` | the contents of `keystore.txt` |
   | `KEYSTORE_PASSWORD` | the password you chose |
   | `KEY_ALIAS` | `deemusiq` |
   | `KEY_PASSWORD` | the password you chose |
4. Re-run the workflow — it now signs with your permanent key.

⚠️ Keep `deemusiq.jks` and its passwords safe. If you lose them you can't ship updates
to already-installed users.

---

## 🚀 Go-Live checklist (everything the owner must configure)

Nothing below is hardcoded — the app and backend run in safe offline/sandbox
modes until you set these. Cross-references: [`DEEMUSIQ_WALLET.md`](./DEEMUSIQ_WALLET.md)
and the backend's own README (private repo
[`s-b-repo/deemusiq-backend`](https://github.com/s-b-repo/deemusiq-backend),
which has a "Secrets you MUST change" section).

| What | Where | How |
|------|-------|-----|
| **Backend deployment** | Render / Docker (see backend README) | Deploy first; everything below hangs off it. |
| **Backend URL in the app** | GitHub repo → Settings → Secrets and variables → Actions → **Variables** → `DEEMUSIQ_BACKEND_URL` | e.g. `https://api.deemusiq.co.za`. Empty = app stays offline-only (still works). |
| **Secure channel key** | Repo **secret** `DEEMUSIQ_CHANNEL_KEY` + backend `.env` `SECURE_CHANNEL_KEY` | Must be identical on both sides: `openssl rand -base64 32`. |
| **Card payments** | Backend `.env`: `PAYFAST_*` / `STRIPE_*` + provider dashboards' webhook URLs → `https://<backend>/webhooks/payfast` / `/webhooks/stripe` | Until set, checkout returns "unavailable" safely. Set `PAYFAST_SANDBOX=false` only when going live. |
| **Crypto payments** | Backend `.env`: `NOWPAYMENTS_*`, `CRYPTO_ADDR_*` | Deposit addresses live **only** on the backend — never in the app. |
| **Verification emails** | Backend `.env`: `SMTP_HOST/PORT/USER/PASS/FROM` | Logs-only until set (registration still works). |
| **Spotify account linking** | Backend `.env`: `SPOTIFY_CLIENT_ID/SECRET`, redirect URI `https://<backend>/link/spotify/callback` (register it in the Spotify dev dashboard) | Other providers show "coming soon" until adapters exist. |
| **Permanent signing keystore** | Repo secrets `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD` | See "Signing" above — **do this before the first public release.** |
| **Site download link** | `deemusiq-site/js/main.js` | Android already wired; goes live with the first `v*` release. |
| **Site social links** | `deemusiq-site/index.html` footer | Currently `#` placeholders — fill in when the accounts exist. |
| **Release process** | — | Bump `pubspec.yaml` `x.y.z+N` → push tag `vx.y.z` → CI checks, builds, signs, attaches `DeeMusiq.apk` to the Release. |

## 📌 Release rule (version numbering)

The `version:` in [`pubspec.yaml`](./pubspec.yaml) is `x.y.z+buildNumber`. When you cut a
release:

- the **`x.y.z` part must equal the next git tag `vx.y.z`** (e.g. `version: 1.0.0+46`
  → tag `v1.0.0`). The in-app update checker compares the running version against the
  latest release tag, so a mismatch makes update prompts wrong.
- the **build number (`+N`) always increments**, on every release *and* every nightly,
  even if `x.y.z` didn't change — Android refuses to install an APK whose build number
  isn't higher than the installed one, and the nightly update checker compares build
  numbers against the Actions run number.

## Accepted internal naming (deliberately NOT renamed)

These still say "spotube" on purpose — they are invisible to users, and renaming them
breaks builds or ecosystem compatibility for zero benefit:

| What | Why it stays |
|------|--------------|
| **l10n keys** (e.g. `about_spotube`, `u_love_spotube`) | The *values* already say DeeMusiq; renaming the keys ripples through 30+ `.arb` files plus generated localization code. |
| **Kotlin package** `oss.krtirtho.spotube` | Only a source-folder namespace; the user-visible `applicationId` is already `za.co.deemusiq.app`. Moving Kotlin packages risks breaking the Android build. |
| **Plugin-ecosystem identifiers** (`spotube-metadata-plugin` topics, `hetu_spotube_plugin`, `.smplug` plugin assets) | DeeMusiq consumes the existing Spotube plugin ecosystem; renaming the identifiers would find zero plugins. |
| **`_spotube._tcp` bonsoir service type** | mDNS discovery for the remote-control/connect feature; both ends must advertise the same service type to find each other. |
| **Internal Dart identifiers** (`package:hetu_spotube_plugin/...` imports, `spotube_plugin.*` storage keys) and the **flatpak id** `com.github.KRTirtho.Spotube` | Pure code-level names coming from upstream dependency packages (the app's own package is already `deemusiq`), plus the Linux flatpak icon id — no user ever sees them. |

## What was rebranded
See [`NOTICE.md`](./NOTICE.md) for the full list. In short: every place a user sees
“Spotube” now says **DeeMusiq**, the icon/splash/accent use your orange hexagon, and the
Android app id is `za.co.deemusiq.app`. Internal code names were intentionally left alone
so the app keeps building.

## Building other platforms (Windows / Linux / macOS / iOS)
The display names for those are already rebranded too. Building them needs more setup
(packaging, Apple/Windows signing). The upstream Spotube build commands still apply —
start from `dart cli/cli.dart build <platform>`. Ask and I can add a desktop workflow.

## Honest caveats
- I could **not compile/test** the build in this environment, so the **first** Actions run
  may surface a small fix (a dependency or a Flutter-version nudge). That's normal for a
  big Flutter app — tell me the error and I'll patch the workflow.
- This app streams metadata/audio the same way Spotube does (Spotify metadata + YouTube
  audio). It does **not** host your own artists' uploads — that's the separate “real
  DeeMusiq platform” we discussed. This rebrand is exactly what you asked for: *Spotube,
  renamed to DeeMusiq.*

## Known TODO: drift DB migration tests

Upstream's `test/drift/` migration suite was removed: its drift-generated
`schema_v*.dart` step files were stale against the current database schema and
no longer compiled (broken at rest, first caught when CI gained a test gate).
The app's real migrations still run (drift step-by-step migrations in
`lib/models/database/`). To restore the suite, regenerate the steps with
`dart run drift_dev make-migrations` on a machine with the Flutter toolchain,
then re-add the tests.
