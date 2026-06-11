import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

class MetadataPluginSearchEndpoint {
  final Hetu hetu;
  MetadataPluginSearchEndpoint(this.hetu);

  HTInstance get hetuMetadataSearch =>
      (hetu.fetch("metadataPlugin") as HTInstance).memberGet("search")
          as HTInstance;

  List<String> get chips {
    return (hetuMetadataSearch.memberGet("chips") as List).cast<String>();
  }

  Future<DeeMusiqSearchResponseObject> all(String query) async {
    if (query.isEmpty) {
      return DeeMusiqSearchResponseObject(
        albums: [],
        artists: [],
        playlists: [],
        tracks: [],
      );
    }

    final raw = await hetuMetadataSearch.invoke(
      "all",
      positionalArgs: [query],
    ) as Map;

    return DeeMusiqSearchResponseObject.fromJson(raw.cast<String, dynamic>());
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> albums(
    String query, {
    int? limit,
    int? offset,
  }) async {
    if (query.isEmpty) {
      return DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>(
        items: [],
        total: 0,
        limit: limit ?? 20,
        hasMore: false,
        nextOffset: null,
      );
    }

    final raw = await hetuMetadataSearch.invoke(
      "albums",
      positionalArgs: [query],
      namedArgs: {
        "limit": limit,
        "offset": offset,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>.fromJson(
      raw.cast<String, dynamic>(),
      (json) => DeeMusiqSimpleAlbumObject.fromJson(json.cast<String, dynamic>()),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>> artists(
    String query, {
    int? limit,
    int? offset,
  }) async {
    if (query.isEmpty) {
      return DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>(
        items: [],
        total: 0,
        limit: limit ?? 20,
        hasMore: false,
        nextOffset: null,
      );
    }

    final raw = await hetuMetadataSearch.invoke(
      "artists",
      positionalArgs: [query],
      namedArgs: {
        "limit": limit,
        "offset": offset,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>.fromJson(
      raw.cast<String, dynamic>(),
      (json) => DeeMusiqFullArtistObject.fromJson(
        json.cast<String, dynamic>(),
      ),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimplePlaylistObject>>
      playlists(
    String query, {
    int? limit,
    int? offset,
  }) async {
    if (query.isEmpty) {
      return DeeMusiqPaginationResponseObject<DeeMusiqSimplePlaylistObject>(
        items: [],
        total: 0,
        limit: limit ?? 20,
        hasMore: false,
        nextOffset: null,
      );
    }

    final raw = await hetuMetadataSearch.invoke(
      "playlists",
      positionalArgs: [query],
      namedArgs: {
        "limit": limit,
        "offset": offset,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<
        DeeMusiqSimplePlaylistObject>.fromJson(
      raw.cast<String, dynamic>(),
      (json) => DeeMusiqSimplePlaylistObject.fromJson(
        json.cast<String, dynamic>(),
      ),
    );
  }

  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
    String query, {
    int? limit,
    int? offset,
  }) async {
    if (query.isEmpty) {
      return DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>(
        items: [],
        total: 0,
        limit: limit ?? 20,
        hasMore: false,
        nextOffset: null,
      );
    }

    final raw = await hetuMetadataSearch.invoke(
      "tracks",
      positionalArgs: [query],
      namedArgs: {
        "limit": limit,
        "offset": offset,
      }..removeWhere((key, value) => value == null),
    ) as Map;

    return DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>.fromJson(
      raw.cast<String, dynamic>(),
      (json) => DeeMusiqFullTrackObject.fromJson(json.cast<String, dynamic>()),
    );
  }
}
