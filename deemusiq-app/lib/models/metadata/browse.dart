part of 'metadata.dart';

@Freezed(genericArgumentFactories: true)
class DeeMusiqBrowseSectionObject<T> with _$DeeMusiqBrowseSectionObject<T> {
  factory DeeMusiqBrowseSectionObject({
    required String id,
    required String title,
    required String externalUri,
    required bool browseMore,
    required List<T> items,
  }) = _DeeMusiqBrowseSectionObject<T>;

  factory DeeMusiqBrowseSectionObject.fromJson(
    Map<String, Object?> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) =>
      _$DeeMusiqBrowseSectionObjectFromJson<T>(
        json,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
}
