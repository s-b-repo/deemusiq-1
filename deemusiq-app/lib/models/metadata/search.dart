part of 'metadata.dart';

@freezed
class DeeMusiqSearchResponseObject with _$DeeMusiqSearchResponseObject {
  factory DeeMusiqSearchResponseObject({
    required List<DeeMusiqSimpleAlbumObject> albums,
    required List<DeeMusiqFullArtistObject> artists,
    required List<DeeMusiqSimplePlaylistObject> playlists,
    required List<DeeMusiqFullTrackObject> tracks,
  }) = _DeeMusiqSearchResponseObject;

  factory DeeMusiqSearchResponseObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqSearchResponseObjectFromJson(json);
}
