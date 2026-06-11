import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

class MetadataPluginPlaylistEndpoint {
  final Hetu hetu;
  MetadataPluginPlaylistEndpoint(this.hetu);

  HTInstance get hetuMetadataPlaylist =>
      (hetu.fetch("metadataPlugin") as HTInstance).memberGet("playlist")
          as HTInstance;

  Future<DeeMusiqFullPlaylistObject> getPlaylist(String id) async {
    final raw = await hetuMetadataPlaylist
        .invoke("getPlaylist", positionalArgs: [id]) as Map;

    return DeeMusiqFullPlaylistObject.fromJson(
      raw.cast<String, dynamic>(),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
    String id, {
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataPlaylist.invoke(
      "tracks",
      positionalArgs: [id],
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

  Future<DeeMusiqFullPlaylistObject?> create(
    String userId, {
    required String name,
    String? description,
    bool? public,
    bool? collaborative,
  }) async {
    final raw = await hetuMetadataPlaylist.invoke(
      "create",
      positionalArgs: [userId],
      namedArgs: {
        "name": name,
        "description": description,
        "public": public,
        "collaborative": collaborative,
      }..removeWhere((key, value) => value == null),
    ) as Map?;

    if (raw == null) return null;

    return DeeMusiqFullPlaylistObject.fromJson(
      raw.cast<String, dynamic>(),
    );
  }

  Future<void> update(
    String playlistId, {
    String? name,
    String? description,
    bool? public,
    bool? collaborative,
  }) async {
    await hetuMetadataPlaylist.invoke(
      "update",
      positionalArgs: [playlistId],
      namedArgs: {
        "name": name,
        "description": description,
        "public": public,
        "collaborative": collaborative,
      }..removeWhere((key, value) => value == null),
    );
  }

  Future<void> addTracks(
    String playlistId, {
    required List<String> trackIds,
    int? position,
  }) async {
    await hetuMetadataPlaylist.invoke(
      "addTracks",
      positionalArgs: [playlistId],
      namedArgs: {
        "trackIds": trackIds,
        "position": position,
      }..removeWhere((key, value) => value == null),
    );
  }

  Future<void> removeTracks(
    String playlistId, {
    required List<String> trackIds,
  }) async {
    await hetuMetadataPlaylist.invoke(
      "removeTracks",
      positionalArgs: [playlistId],
      namedArgs: {
        "trackIds": trackIds,
      }..removeWhere((key, value) => value == null),
    );
  }

  Future<void> save(String playlistId) async {
    await hetuMetadataPlaylist.invoke(
      "save",
      positionalArgs: [playlistId],
    );
  }

  Future<void> unsave(String playlistId) async {
    await hetuMetadataPlaylist.invoke(
      "unsave",
      positionalArgs: [playlistId],
    );
  }

  Future<void> deletePlaylist(String playlistId) async {
    return await hetuMetadataPlaylist.invoke(
      "deletePlaylist",
      positionalArgs: [playlistId],
    );
  }
}
