# NOTICE — DeeMusiq app attribution

The **DeeMusiq** application is a rebrand/derivative of **Spotube**, an open-source
project by **Kingkor Roy Tirtho** and contributors.

> This product includes software developed by Kingkor Roy Tirtho.

- Upstream project: https://github.com/KRTirtho/spotube
- License: **BSD-4-Clause** — see [`LICENSE`](./LICENSE) (retained unchanged).

Per the BSD-4-Clause license, the original copyright notice and the acknowledgement
above are retained. The Spotube name and the names of its contributors are **not**
used to endorse or promote DeeMusiq. "DeeMusiq" branding, logo and product identity
© The Dembe Group.

## What was changed in this rebrand

Only user-facing identity was changed; the engine is unmodified Spotube:
- App display name → **DeeMusiq** (Android/iOS/macOS/Linux/Windows)
- Android application id → `za.co.deemusiq.app`
- App icon & splash → DeeMusiq hexagon logo (orange `#FF5722`)
- Default accent colour → DeeMusiq orange
- App window/title strings → DeeMusiq
- Build/release CI replaced with `deemusiq-android.yml`

Additional rebranding applied:
- Discord Rich Presence assets → `deemusiq-logo-foreground`
- Linux logger directory → `~/.local/state/deemusiq/` (was `spotube`)
- macOS sandbox migration path → `za.co.deemusiq.app`
- Audio service channel IDs → `deemusiq`, `za.co.deemusiq.app`
- OpenCollective links → `opencollective.com/deemusiq`
- Local tracks cache directory → `deemusiq/`

## DeeMusiq-specific additions (not in upstream Spotube)

- **Offline DRM**: downloaded songs are AES-256-GCM encrypted with a device-bound
  key. Files carry a `.deemusiq` extension — invisible to OS media scanners and
  unplayable outside the DeeMusiq app.
- **Multi-engine YouTube audio extraction**: audio-only streams via
  `youtube_explode_dart` (primary) + yt-dlp + NewPipe extractor fallbacks.
  No video is decoded or displayed — audio-only playback.
- **Play Store / F-Droid dual builds**: `playstore` flavor for Google Play
  (with Play Integrity, billing) and `fdroid` flavor for F-Droid / direct APK
  (fully FOSS, no Google dependencies).
- **iOS support**: `Info.plist` configured with DeeMusiq bundle ID
  (`za.co.deemusiq.app`), audio background mode, App Group for home widget,
  and `deemusiq://` URL scheme for deep linking.
- **DeeMusiq native catalog**: all metadata endpoints talk to the DeeMusiq
  backend `/metadata` API — no Spotify dependency for the built-in provider.
- **DeeMusiq Wallet**: server-authoritative token economy with Ed25519
  device authentication, card/crypto top-ups, and creator support.

The internal Dart package name remains `spotube` (changing it would rewrite
hundreds of internal imports with no user-visible benefit). Plugin ecosystem
identifiers (`spotube-plugin-*`, `hetu_spotube_plugin`) are deliberately kept
for compatibility with the existing Spotube plugin ecosystem.
