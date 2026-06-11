part of 'metadata.dart';

@freezed
class DeeMusiqFullPlaylistObject with _$DeeMusiqFullPlaylistObject {
  factory DeeMusiqFullPlaylistObject({
    required String id,
    required String name,
    required String description,
    required String externalUri,
    required DeeMusiqUserObject owner,
    @Default([]) List<DeeMusiqImageObject> images,
    @Default([]) List<DeeMusiqUserObject> collaborators,
    @Default(false) bool collaborative,
    @Default(false) bool public,
  }) = _DeeMusiqFullPlaylistObject;

  factory DeeMusiqFullPlaylistObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqFullPlaylistObjectFromJson(json);
}

@freezed
class DeeMusiqSimplePlaylistObject with _$DeeMusiqSimplePlaylistObject {
  factory DeeMusiqSimplePlaylistObject({
    required String id,
    required String name,
    required String description,
    required String externalUri,
    required DeeMusiqUserObject owner,
    @Default([]) List<DeeMusiqImageObject> images,
  }) = _DeeMusiqSimplePlaylistObject;

  factory DeeMusiqSimplePlaylistObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqSimplePlaylistObjectFromJson(json);
}
