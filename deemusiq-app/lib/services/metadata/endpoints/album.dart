import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

class MetadataPluginAlbumEndpoint {
  final Hetu hetu;
  MetadataPluginAlbumEndpoint(this.hetu);

  HTInstance get hetuMetadataAlbum =>
      (hetu.fetch("metadataPlugin") as HTInstance).memberGet("album")
          as HTInstance;

  Future<DeeMusiqFullAlbumObject> getAlbum(String id) async {
    final raw =
        await hetuMetadataAlbum.invoke("getAlbum", positionalArgs: [id]) as Map;

    return DeeMusiqFullAlbumObject.fromJson(
      raw.cast<String, dynamic>(),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
    String id, {
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataAlbum.invoke(
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

  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> releases({
    int? offset,
    int? limit,
  }) async {
    final raw = await hetuMetadataAlbum.invoke(
      "releases",
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

  Future<void> save(List<String> ids) async {
    await hetuMetadataAlbum.invoke(
      "save",
      positionalArgs: [ids],
    );
  }

  Future<void> unsave(List<String> ids) async {
    await hetuMetadataAlbum.invoke(
      "unsave",
      positionalArgs: [ids],
    );
  }
}
