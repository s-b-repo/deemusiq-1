/// Aggregated record of how much a user has supported one creator/artist,
/// across pushes and direct supports. Drives the "Creators you support" menu
/// and the earnings breakdown.
class SupportedCreator {
  final String id;
  final String name;
  final String? imageUrl;
  final int totalTokens;
  final int contributions;
  final DateTime lastSupportedAt;

  const SupportedCreator({
    required this.id,
    required this.name,
    required this.totalTokens,
    required this.contributions,
    required this.lastSupportedAt,
    this.imageUrl,
  });

  SupportedCreator copyWith({
    String? name,
    String? imageUrl,
    int? totalTokens,
    int? contributions,
    DateTime? lastSupportedAt,
  }) {
    return SupportedCreator(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      totalTokens: totalTokens ?? this.totalTokens,
      contributions: contributions ?? this.contributions,
      lastSupportedAt: lastSupportedAt ?? this.lastSupportedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "totalTokens": totalTokens,
        "contributions": contributions,
        "lastSupportedAt": lastSupportedAt.toIso8601String(),
      };

  factory SupportedCreator.fromJson(Map<String, dynamic> json) {
    return SupportedCreator(
      id: json["id"] as String,
      name: json["name"] as String? ?? "Unknown artist",
      imageUrl: json["imageUrl"] as String?,
      totalTokens: (json["totalTokens"] as num?)?.toInt() ?? 0,
      contributions: (json["contributions"] as num?)?.toInt() ?? 0,
      lastSupportedAt:
          DateTime.tryParse(json["lastSupportedAt"] as String? ?? "") ??
              DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
