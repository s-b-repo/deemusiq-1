import 'package:shadcn_flutter/shadcn_flutter.dart';

/// DeeMusiq brand theme — matches the website CSS at deemusiq-site/css/styles.css.
///
/// Dark, warm, honeycomb-glow aesthetic built from the site's CSS custom
/// properties. Applied as the DEFAULT theme when no accent color is selected,
/// and overrides the built-in "orange" scheme to use the brand orange.
///
/// Website color map:
///   --orange:    #FF5722   primary brand orange
///   --orange-2:  #FF7A45   lighter
///   --orange-3:  #FF9466   lightest
///   --gold:      #FFB300   accent gold
///   --ink:       #0c0a09   page background (darkest)
///   --ink-2:     #13100e
///   --surface:   #1a1512   card/panel bg
///   --surface-2: #221b16   hovered surface
///   --line:      rgba(255,120,60,.16)   border
///   --line-2:    rgba(255,255,255,.08)
///   --cream:     #f6efe9   primary text
///   --muted:     #a89c92   secondary text
///   --muted-2:   #7e736b   tertiary text
class DeeMusiqTheme {
  DeeMusiqTheme._();

  // ── Brand colors ──────────────────────────────────────────────────────

  static const Color orange = Color(0xFFFF5722);
  static const Color orange2 = Color(0xFFFF7A45);
  static const Color orange3 = Color(0xFFFF9466);
  static const Color gold = Color(0xFFFFB300);
  static const Color ink = Color(0xFF0C0A09);
  static const Color ink2 = Color(0xFF13100E);
  static const Color surface = Color(0xFF1A1512);
  static const Color surface2 = Color(0xFF221B16);
  static const Color line = Color(0x29FF783C);   // rgba(255,120,60,.16)
  static const Color line2 = Color(0x14FFFFFF);   // rgba(255,255,255,.08)
  static const Color cream = Color(0xFFF6EFE9);
  static const Color muted = Color(0xFFA89C92);
  static const Color muted2 = Color(0xFF7E736B);

  // ── ShadcnFlutter ColorScheme ──────────────────────────────────────────

  /// Dark theme matching the DeeMusiq website.
  static ColorScheme dark() => ColorScheme(
        background: ink,
        foreground: cream,
        primary: orange,
        primaryForeground: const Color(0xFF1A0D06), // dark text on orange
        secondary: orange2,
        secondaryForeground: cream,
        muted: surface,
        mutedForeground: muted,
        card: surface,
        cardForeground: cream,
        popover: surface2,
        popoverForeground: cream,
        border: line,
        input: surface2,
        accent: orange,
        accentForeground: const Color(0xFF1A0D06),
        destructive: const Color(0xFFEF4444),
        destructiveForeground: cream,
        ring: orange,
        radius: 0.5,
      );

  /// Light theme (rarely used — DeeMusiq is dark-first). Keeps the brand
  /// orange but on a warm cream background.
  static ColorScheme light() => ColorScheme(
        background: cream,
        foreground: ink,
        primary: orange,
        primaryForeground: Colors.white,
        secondary: orange2,
        secondaryForeground: ink,
        muted: const Color(0xFFF0EAE4),
        mutedForeground: muted2,
        card: Colors.white,
        cardForeground: ink,
        popover: Colors.white,
        popoverForeground: ink,
        border: const Color(0x20FF783C),
        input: const Color(0xFFF0EAE4),
        accent: orange,
        accentForeground: Colors.white,
        destructive: const Color(0xFFEF4444),
        destructiveForeground: Colors.white,
        ring: orange,
        radius: 0.5,
      );

  // ── Theme builders (match ShadcnFlutter's LegacyColorSchemes pattern) ──

  /// Returns the appropriate ColorScheme for the given [ThemeMode].
  static ColorScheme forMode(ThemeMode mode) =>
      mode == ThemeMode.light ? light() : dark();

  /// Legacy-style factory matching `LegacyColorSchemes.orange` signature,
  /// so it can be dropped into `colorSchemeMap` without changing callers.
  static ColorScheme Function(ThemeMode) get schemeFactory =>
      (ThemeMode mode) => forMode(mode);
}

/// Extension that injects the DeeMusiq theme as the default in the
/// `colorSchemeMap` used by [main.dart]. Call once during app init.
void registerDeeMusiqTheme(Map<String, ColorScheme Function(ThemeMode)> map) {
  // Override the built-in "orange" scheme with the brand orange.
  map['orange'] = DeeMusiqTheme.schemeFactory;
  // Add a dedicated "deemusiq" key for the full website-matched theme.
  map['deemusiq'] = DeeMusiqTheme.schemeFactory;
}
