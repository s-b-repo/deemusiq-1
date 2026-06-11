part of 'metadata.dart';

enum DeeMusiqAlbumType {
  album,
  single,
  compilation,
}

@freezed
class DeeMusiqFullAlbumObject with _$DeeMusiqFullAlbumObject {
  factory DeeMusiqFullAlbumObject({
    required String id,
    required String name,
    required List<DeeMusiqSimpleArtistObject> artists,
    @Default([]) List<DeeMusiqImageObject> images,
    required String releaseDate,
    required String externalUri,
    required int totalTracks,
    required DeeMusiqAlbumType albumType,
    String? recordLabel,
    List<String>? genres,
  }) = _DeeMusiqFullAlbumObject;

  factory DeeMusiqFullAlbumObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqFullAlbumObjectFromJson(json);
}

@freezed
class DeeMusiqSimpleAlbumObject with _$DeeMusiqSimpleAlbumObject {
  factory DeeMusiqSimpleAlbumObject({
    required String id,
    required String name,
    required String externalUri,
    required List<DeeMusiqSimpleArtistObject> artists,
    @Default([]) List<DeeMusiqImageObject> images,
    required DeeMusiqAlbumType albumType,
    String? releaseDate,
  }) = _DeeMusiqSimpleAlbumObject;

  factory DeeMusiqSimpleAlbumObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqSimpleAlbumObjectFromJson(json);
}
