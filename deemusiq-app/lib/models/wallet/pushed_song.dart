/// Aggregated push stats for a single song. Drives the "Trending / most-pushed"
/// leaderboard. In a real deployment these counts would be server-side and
/// shared across users; here they accumulate from this device's own pushes.
class PushedSong {
  final String id;
  final String title;
  final String artist;
  final String? artistId;
  final String? imageUrl;
  final int totalTokens;
  final int pushCount;
  final DateTime lastPushedAt;

  const PushedSong({
    required this.id,
    required this.title,
    required this.artist,
    required this.totalTokens,
    required this.pushCount,
    required this.lastPushedAt,
    this.artistId,
    this.imageUrl,
  });

  PushedSong copyWith({
    int? totalTokens,
    int? pushCount,
    DateTime? lastPushedAt,
  }) {
    return PushedSong(
      id: id,
      title: title,
      artist: artist,
      artistId: artistId,
      imageUrl: imageUrl,
      totalTokens: totalTokens ?? this.totalTokens,
      pushCount: pushCount ?? this.pushCount,
      lastPushedAt: lastPushedAt ?? this.lastPushedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "artist": artist,
        "artistId": artistId,
        "imageUrl": imageUrl,
        "totalTokens": totalTokens,
        "pushCount": pushCount,
        "lastPushedAt": lastPushedAt.toIso8601String(),
      };

  factory PushedSong.fromJson(Map<String, dynamic> json) {
    return PushedSong(
      id: json["id"] as String,
      title: json["title"] as String? ?? "Unknown track",
      artist: json["artist"] as String? ?? "Unknown artist",
      artistId: json["artistId"] as String?,
      imageUrl: json["imageUrl"] as String?,
      totalTokens: (json["totalTokens"] as num?)?.toInt() ?? 0,
      pushCount: (json["pushCount"] as num?)?.toInt() ?? 0,
      lastPushedAt: DateTime.tryParse(json["lastPushedAt"] as String? ?? "") ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
