import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

class MetadataPluginUserEndpoint {
  final Hetu hetu;
  MetadataPluginUserEndpoint(this.hetu);

  HTInstance get hetuMetadataUser =>
      (hetu.fetch("metadataPlugin") as HTInstance).memberGet("user")
          as HTInstance;

  Future<DeeMusiqUserObject> me() async {
    final raw = await hetuMetadataUser.invoke("me") as Map;

    return DeeMusiqUserObject.fromJson(
      raw.cast<String, dynamic>(),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> savedTracks({
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataUser.invoke(
      "savedTracks",
      namedArgs: {
        "offset": offset,
        "limit": limit,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>.fromJson(
      raw.cast<String, dynamic>(),
      (Map json) =>
          DeeMusiqFullTrackObject.fromJson(json.cast<String, dynamic>()),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimplePlaylistObject>>
      savedPlaylists({
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataUser.invoke(
      "savedPlaylists",
      namedArgs: {
        "offset": offset,
        "limit": limit,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<
        DeeMusiqSimplePlaylistObject>.fromJson(
      raw.cast<String, dynamic>(),
      (Map json) =>
          DeeMusiqSimplePlaylistObject.fromJson(json.cast<String, dynamic>()),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>>
      savedAlbums({
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataUser.invoke(
      "savedAlbums",
      namedArgs: {
        "offset": offset,
        "limit": limit,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>.fromJson(
      raw.cast<String, dynamic>(),
      (Map json) =>
          DeeMusiqSimpleAlbumObject.fromJson(json.cast<String, dynamic>()),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>>
      savedArtists({
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataUser.invoke(
      "savedArtists",
      namedArgs: {
        "offset": offset,
        "limit": limit,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>.fromJson(
      raw.cast<String, dynamic>(),
      (Map json) =>
          DeeMusiqFullArtistObject.fromJson(json.cast<String, dynamic>()),
    );
  }

  Future<bool> isSavedPlaylist(String playlistId) async {
    return await hetuMetadataUser.invoke(
      "isSavedPlaylist",
      positionalArgs: [playlistId],
    ) as bool;
  }

  Future<List<bool>> isSavedTracks(List<String> ids) async {
    final values = await hetuMetadataUser.invoke(
      "isSavedTracks",
      positionalArgs: [ids],
    );
    return (values as List).cast<bool>();
  }

  Future<List<bool>> isSavedAlbums(List<String> ids) async {
    final values = await hetuMetadataUser.invoke(
      "isSavedAlbums",
      positionalArgs: [ids],
    ) as List;
    return values.cast<bool>();
  }

  Future<List<bool>> isSavedArtists(List<String> ids) async {
    final values = await hetuMetadataUser.invoke(
      "isSavedArtists",
      positionalArgs: [ids],
    ) as List;

    return values.cast<bool>();
  }
}
