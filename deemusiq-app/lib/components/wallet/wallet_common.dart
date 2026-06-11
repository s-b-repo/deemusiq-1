import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';

/// Brand accent used across the wallet feature.
const deeMusiqOrange = Color(0xFFFF5722);

/// Formats a token count with thousands separators, e.g. 1234 -> "1,234".
String formatTokens(int value) {
  final digits = value.abs().toString();
  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i != 0 && (digits.length - i) % 3 == 0) buffer.write(",");
    buffer.write(digits[i]);
  }
  return "${value < 0 ? "-" : ""}$buffer";
}

/// Human, compact relative time, e.g. "just now", "5m ago", "3d ago".
String relativeTime(DateTime time) {
  final diff = DateTime.now().difference(time);
  if (diff.inSeconds < 45) return "just now";
  if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
  if (diff.inHours < 24) return "${diff.inHours}h ago";
  if (diff.inDays < 7) return "${diff.inDays}d ago";
  if (diff.inDays < 30) return "${(diff.inDays / 7).floor()}w ago";
  if (diff.inDays < 365) return "${(diff.inDays / 30).floor()}mo ago";
  return "${(diff.inDays / 365).floor()}y ago";
}

/// A small confirmation toast in DeeMusiq style.
void showWalletToast(
  BuildContext context,
  String message, {
  IconData icon = DeeMusiqIcons.token,
}) {
  showToast(
    context: context,
    location: ToastLocation.bottomCenter,
    builder: (context, overlay) {
      return SurfaceCard(
        child: Basic(
          leading: Icon(icon, color: deeMusiqOrange),
          title: Text(message),
        ),
      );
    },
  );
}
