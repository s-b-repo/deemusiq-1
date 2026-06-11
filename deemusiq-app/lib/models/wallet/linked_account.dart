import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';

/// External music services a DeeMusiq account can be linked to. Spotify is the
/// first provider; the rest are scaffolded so linkage is one enum entry + an
/// OAuth client away. Real linking needs each provider's OAuth client
/// credentials (see DEEMUSIQ_WALLET.md).
enum LinkedProvider {
  spotify,
  youtubeMusic,
  appleMusic,
  deezer,
  tidal;

  String get label {
    switch (this) {
      case LinkedProvider.spotify:
        return "Spotify";
      case LinkedProvider.youtubeMusic:
        return "YouTube Music";
      case LinkedProvider.appleMusic:
        return "Apple Music";
      case LinkedProvider.deezer:
        return "Deezer";
      case LinkedProvider.tidal:
        return "TIDAL";
    }
  }

  String get description {
    switch (this) {
      case LinkedProvider.spotify:
        return "Import your playlists, liked songs and top artists";
      case LinkedProvider.youtubeMusic:
        return "Sync library and listening history";
      case LinkedProvider.appleMusic:
        return "Bring across your saved music";
      case LinkedProvider.deezer:
        return "Import favourites and playlists";
      case LinkedProvider.tidal:
        return "Sync your hi-fi library";
    }
  }

  IconData get icon {
    switch (this) {
      case LinkedProvider.spotify:
        return DeeMusiqIcons.spotify;
      case LinkedProvider.youtubeMusic:
        return DeeMusiqIcons.youtube;
      case LinkedProvider.appleMusic:
        return DeeMusiqIcons.appleMusic;
      case LinkedProvider.deezer:
        return DeeMusiqIcons.deezer;
      case LinkedProvider.tidal:
        return DeeMusiqIcons.tidal;
    }
  }

  Color get accent {
    switch (this) {
      case LinkedProvider.spotify:
        return const Color(0xFF1DB954);
      case LinkedProvider.youtubeMusic:
        return const Color(0xFFFF0000);
      case LinkedProvider.appleMusic:
        return const Color(0xFFFA2D48);
      case LinkedProvider.deezer:
        return const Color(0xFFA238FF);
      case LinkedProvider.tidal:
        return const Color(0xFF00FFFF);
    }
  }
}

/// A connected external account. In this build we store the public profile
/// fields only; real OAuth tokens would live in the app's encrypted store.
class LinkedAccount {
  final LinkedProvider provider;
  final String displayName;
  final String? externalId;
  final DateTime connectedAt;

  const LinkedAccount({
    required this.provider,
    required this.displayName,
    required this.connectedAt,
    this.externalId,
  });

  Map<String, dynamic> toJson() => {
        "provider": provider.name,
        "displayName": displayName,
        "externalId": externalId,
        "connectedAt": connectedAt.toIso8601String(),
      };

  factory LinkedAccount.fromJson(Map<String, dynamic> json) {
    return LinkedAccount(
      provider: LinkedProvider.values.firstWhere(
        (e) => e.name == json["provider"],
        orElse: () => LinkedProvider.spotify,
      ),
      displayName: json["displayName"] as String? ?? "",
      externalId: json["externalId"] as String?,
      connectedAt: DateTime.tryParse(json["connectedAt"] as String? ?? "") ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
