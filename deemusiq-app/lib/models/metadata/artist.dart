part of 'metadata.dart';

@freezed
class DeeMusiqFullArtistObject with _$DeeMusiqFullArtistObject {
  factory DeeMusiqFullArtistObject({
    required String id,
    required String name,
    required String externalUri,
    @Default([]) List<DeeMusiqImageObject> images,
    List<String>? genres,
    int? followers,
  }) = _DeeMusiqFullArtistObject;

  factory DeeMusiqFullArtistObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqFullArtistObjectFromJson(json);
}

@freezed
class DeeMusiqSimpleArtistObject with _$DeeMusiqSimpleArtistObject {
  factory DeeMusiqSimpleArtistObject({
    required String id,
    required String name,
    required String externalUri,
    List<DeeMusiqImageObject>? images,
  }) = _DeeMusiqSimpleArtistObject;

  factory DeeMusiqSimpleArtistObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqSimpleArtistObjectFromJson(json);
}

extension DeeMusiqFullArtistObjectAsString on List<DeeMusiqFullArtistObject> {
  String asString() {
    return map((e) => e.name).join(", ");
  }
}

extension DeeMusiqSimpleArtistObjectAsString on List<DeeMusiqSimpleArtistObject> {
  String asString() {
    return map((e) => e.name).join(", ");
  }
}
