import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hetu_script/hetu_script.dart';

import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/services/metadata/endpoints/album.dart';
import 'package:deemusiq/services/metadata/endpoints/artist.dart';
import 'package:deemusiq/services/metadata/endpoints/audio_source.dart';
import 'package:deemusiq/services/metadata/endpoints/auth.dart';
import 'package:deemusiq/services/metadata/endpoints/browse.dart';
import 'package:deemusiq/services/metadata/endpoints/core.dart';
import 'package:deemusiq/services/metadata/endpoints/playlist.dart';
import 'package:deemusiq/services/metadata/endpoints/search.dart';
import 'package:deemusiq/services/metadata/endpoints/track.dart';
import 'package:deemusiq/services/metadata/endpoints/user.dart';
import 'package:deemusiq/services/wallet/payment_service.dart'
    show PaymentGatewayConfig;
import 'package:deemusiq/services/youtube_engine/youtube_engine.dart';

/// The built-in "plugin" identity DeeMusiq presents in place of any external
/// metadata provider. It carries no bytecode — the endpoints are native Dart
/// (see below) talking to the DeeMusiq backend `/metadata` API.
final PluginConfiguration kDeeMusiqNativePluginConfig = PluginConfiguration(
  name: "DeeMusiq",
  description: "DeeMusiq's own catalog — artists, albums and tracks.",
  version: "1.0.0",
  author: "DeeMusiq",
  entryPoint: "",
  pluginApiVersion: "2.0.0",
  apis: const [],
  abilities: const [
    PluginAbilities.metadata,
    PluginAbilities.audioSource,
  ],
);

/// Shared throwaway interpreter: the native endpoints extend the Hetu-backed
/// base classes (so they satisfy the same types) but override every method, so
/// this instance is never actually used.
final Hetu _dummyHetu = Hetu();

// ── Playable-source encoding ─────────────────────────────────────────────────
// Each track carries its audio source in `externalUri` so the audio-source
// endpoint can resolve it without a second lookup.
const _ytPrefix = "ytsource:";
const _urlPrefix = "urlsource:";

String _encodeSource(Map? source) {
  if (source == null) return "";
  switch (source["type"]) {
    case "youtube":
      return "$_ytPrefix${source["youtubeId"]}";
    case "url":
      return "$_urlPrefix${source["url"]}";
    default:
      return "";
  }
}

// ── Backend client ───────────────────────────────────────────────────────────

class _CatalogApi {
  Dio _client() => Dio(
        BaseOptions(
          baseUrl: PaymentGatewayConfig.backendBaseUrl,
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );

  bool get isConfigured => PaymentGatewayConfig.backendBaseUrl.isNotEmpty;

  Future<Map<String, dynamic>> _get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final res = await _client().get(path, queryParameters: query);
    return (res.data as Map).cast<String, dynamic>();
  }

  Future<Map<String, dynamic>> search(String q, String type, int limit) =>
      _get("/metadata/search", query: {"q": q, "type": type, "limit": limit});
  Future<Map<String, dynamic>> home() => _get("/metadata/home");
  Future<Map<String, dynamic>> artist(String id) => _get("/metadata/artist/$id");
  Future<Map<String, dynamic>> album(String id) => _get("/metadata/album/$id");
  Future<Map<String, dynamic>> playlist(String id) =>
      _get("/metadata/playlist/$id");
  Future<Map<String, dynamic>> track(String id) => _get("/metadata/track/$id");
}

// ── Mappers: backend JSON → app model objects ────────────────────────────────

List<DeeMusiqImageObject> _images(String? url) =>
    url == null || url.isEmpty ? const [] : [DeeMusiqImageObject(url: url)];

DeeMusiqAlbumType _albumType(String? t) {
  switch (t) {
    case "single":
    case "ep":
      return DeeMusiqAlbumType.single;
    case "compilation":
      return DeeMusiqAlbumType.compilation;
    default:
      return DeeMusiqAlbumType.album;
  }
}

DeeMusiqSimpleArtistObject _simpleArtistFromRef(Map a) =>
    DeeMusiqSimpleArtistObject(
      id: (a["id"] ?? "").toString(),
      name: (a["name"] ?? "").toString(),
      externalUri: "deemusiq:artist:${a["id"] ?? ""}",
    );

DeeMusiqFullArtistObject _fullArtist(Map a) => DeeMusiqFullArtistObject(
      id: (a["id"] ?? "").toString(),
      name: (a["name"] ?? "").toString(),
      externalUri: "deemusiq:artist:${a["id"] ?? ""}",
      images: _images(a["imageUrl"] as String?),
    );

DeeMusiqSimpleAlbumObject _simpleAlbum(Map a) {
  final artistRef = a["artist"] as Map?;
  return DeeMusiqSimpleAlbumObject(
    id: (a["id"] ?? "").toString(),
    name: (a["title"] ?? a["name"] ?? "").toString(),
    externalUri: "deemusiq:album:${a["id"] ?? ""}",
    artists: artistRef != null ? [_simpleArtistFromRef(artistRef)] : const [],
    images: _images(a["coverUrl"] as String?),
    albumType: _albumType(a["albumType"] as String?),
    releaseDate: a["releaseDate"]?.toString(),
  );
}

DeeMusiqSimpleAlbumObject _trackAlbum(Map t) {
  final album = t["album"] as Map?;
  final artistRef = t["artist"] as Map?;
  if (album != null) {
    return DeeMusiqSimpleAlbumObject(
      id: (album["id"] ?? "").toString(),
      name: (album["title"] ?? "").toString(),
      externalUri: "deemusiq:album:${album["id"] ?? ""}",
      artists: artistRef != null ? [_simpleArtistFromRef(artistRef)] : const [],
      images: _images((album["coverUrl"] ?? t["coverUrl"]) as String?),
      albumType: DeeMusiqAlbumType.album,
    );
  }
  // Single/loose track: synthesise a one-track album from the track itself.
  return DeeMusiqSimpleAlbumObject(
    id: (t["id"] ?? "").toString(),
    name: (t["title"] ?? "").toString(),
    externalUri: "deemusiq:track:${t["id"] ?? ""}",
    artists: artistRef != null ? [_simpleArtistFromRef(artistRef)] : const [],
    images: _images(t["coverUrl"] as String?),
    albumType: DeeMusiqAlbumType.single,
  );
}

DeeMusiqFullTrackObject _track(Map t) {
  final artistRef = t["artist"] as Map?;
  return DeeMusiqTrackObject.full(
    id: (t["id"] ?? "").toString(),
    name: (t["title"] ?? "").toString(),
    externalUri: _encodeSource(t["source"] as Map?),
    artists: artistRef != null ? [_simpleArtistFromRef(artistRef)] : const [],
    album: _trackAlbum(t),
    durationMs: (t["durationMs"] as num?)?.toInt() ?? 0,
    isrc: "",
    explicit: t["explicit"] == true,
  ) as DeeMusiqFullTrackObject;
}

DeeMusiqUserObject get _deemusiqOwner => DeeMusiqUserObject(
      id: "deemusiq",
      name: "DeeMusiq",
      externalUri: "deemusiq:user:deemusiq",
    );

DeeMusiqSimplePlaylistObject _simplePlaylist(Map p) =>
    DeeMusiqSimplePlaylistObject(
      id: (p["id"] ?? "").toString(),
      name: (p["title"] ?? "").toString(),
      description: (p["description"] ?? "").toString(),
      externalUri: "deemusiq:playlist:${p["id"] ?? ""}",
      owner: _deemusiqOwner,
      images: _images(p["coverUrl"] as String?),
    );

DeeMusiqPaginationResponseObject<T> _page<T>(List<T> items) =>
    DeeMusiqPaginationResponseObject<T>(
      limit: items.length,
      nextOffset: null,
      total: items.length,
      hasMore: false,
      items: items,
    );

List<Map> _list(dynamic v) =>
    (v as List? ?? const []).whereType<Map>().toList();

// ── Native endpoints ─────────────────────────────────────────────────────────

class _NativeSearch extends MetadataPluginSearchEndpoint {
  final _CatalogApi api;
  _NativeSearch(this.api) : super(_dummyHetu);

  @override
  List<String> get chips => const ["Tracks", "Artists", "Albums", "Playlists"];

  @override
  Future<DeeMusiqSearchResponseObject> all(String query) async {
    if (!api.isConfigured) {
      return DeeMusiqSearchResponseObject(
          albums: const [], artists: const [], playlists: const [], tracks: const []);
    }
    final d = await api.search(query, "all", 20);
    return DeeMusiqSearchResponseObject(
      albums: _list(d["albums"]).map(_simpleAlbum).toList(),
      artists: _list(d["artists"]).map(_fullArtist).toList(),
      playlists: _list(d["playlists"]).map(_simplePlaylist).toList(),
      tracks: _list(d["tracks"]).map(_track).toList(),
    );
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> albums(
      String query, {int? limit, int? offset}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.search(query, "album", limit ?? 20);
    return _page(_list(d["albums"]).map(_simpleAlbum).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>> artists(
      String query, {int? limit, int? offset}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.search(query, "artist", limit ?? 20);
    return _page(_list(d["artists"]).map(_fullArtist).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimplePlaylistObject>>
      playlists(String query, {int? limit, int? offset}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.search(query, "playlist", limit ?? 20);
    return _page(_list(d["playlists"]).map(_simplePlaylist).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
      String query, {int? limit, int? offset}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.search(query, "track", limit ?? 20);
    return _page(_list(d["tracks"]).map(_track).toList());
  }
}

class _NativeAlbum extends MetadataPluginAlbumEndpoint {
  final _CatalogApi api;
  _NativeAlbum(this.api) : super(_dummyHetu);

  @override
  Future<DeeMusiqFullAlbumObject> getAlbum(String id) async {
    final a = await api.album(id);
    final artistRef = a["artist"] as Map?;
    final tracks = _list(a["tracks"]);
    return DeeMusiqFullAlbumObject(
      id: (a["id"] ?? "").toString(),
      name: (a["title"] ?? "").toString(),
      artists: artistRef != null ? [_simpleArtistFromRef(artistRef)] : const [],
      images: _images(a["coverUrl"] as String?),
      releaseDate: (a["releaseDate"] ?? "").toString(),
      externalUri: "deemusiq:album:$id",
      totalTracks: tracks.length,
      albumType: _albumType(a["albumType"] as String?),
    );
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
      String id, {int? offset, int? limit}) async {
    final a = await api.album(id);
    return _page(_list(a["tracks"]).map(_track).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> releases(
      {int? offset, int? limit}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.home();
    final albums = <DeeMusiqSimpleAlbumObject>[];
    for (final s in _list(d["sections"])) {
      if (s["type"] == "albums") {
        albums.addAll(_list(s["items"]).map(_simpleAlbum));
      }
    }
    return _page(albums);
  }

  @override
  Future<void> save(List<String> ids) async {}
  @override
  Future<void> unsave(List<String> ids) async {}
}

class _NativeArtist extends MetadataPluginArtistEndpoint {
  final _CatalogApi api;
  _NativeArtist(this.api) : super(_dummyHetu);

  @override
  Future<DeeMusiqFullArtistObject> getArtist(String id) async {
    final a = await api.artist(id);
    return _fullArtist(a);
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> topTracks(
      String id, {int? offset, int? limit}) async {
    final a = await api.artist(id);
    return _page(_list(a["topTracks"]).map(_track).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> albums(
      String id, {int? offset, int? limit}) async {
    final a = await api.artist(id);
    return _page(_list(a["albums"]).map(_simpleAlbum).toList());
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>> related(
          String id, {int? offset, int? limit}) async =>
      _page(const []);

  @override
  Future<void> save(List<String> ids) async {}
  @override
  Future<void> unsave(List<String> ids) async {}
}

class _NativePlaylist extends MetadataPluginPlaylistEndpoint {
  final _CatalogApi api;
  _NativePlaylist(this.api) : super(_dummyHetu);

  @override
  Future<DeeMusiqFullPlaylistObject> getPlaylist(String id) async {
    final p = await api.playlist(id);
    return DeeMusiqFullPlaylistObject(
      id: (p["id"] ?? "").toString(),
      name: (p["title"] ?? "").toString(),
      description: (p["description"] ?? "").toString(),
      externalUri: "deemusiq:playlist:$id",
      owner: _deemusiqOwner,
      images: _images(p["coverUrl"] as String?),
    );
  }

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> tracks(
      String id, {int? offset, int? limit}) async {
    final p = await api.playlist(id);
    return _page(_list(p["tracks"]).map(_track).toList());
  }

  // User-created playlists aren't supported by the catalog backend yet.
  @override
  Future<DeeMusiqFullPlaylistObject?> create(String userId,
          {required String name,
          String? description,
          bool? public,
          bool? collaborative}) async =>
      null;
  @override
  Future<void> update(String playlistId,
      {String? name,
      String? description,
      bool? public,
      bool? collaborative}) async {}
  @override
  Future<void> addTracks(String playlistId,
      {required List<String> trackIds, int? position}) async {}
  @override
  Future<void> removeTracks(String playlistId,
      {required List<String> trackIds}) async {}
  @override
  Future<void> save(String playlistId) async {}
  @override
  Future<void> unsave(String playlistId) async {}
  @override
  Future<void> deletePlaylist(String playlistId) async {}
}

class _NativeTrack extends MetadataPluginTrackEndpoint {
  final _CatalogApi api;
  _NativeTrack(this.api) : super(_dummyHetu);

  @override
  Future<DeeMusiqFullTrackObject> getTrack(String id) async {
    final t = await api.track(id);
    return _track(t);
  }

  @override
  Future<List<DeeMusiqFullTrackObject>> radio(String id) async => const [];
  @override
  Future<void> save(List<String> ids) async {}
  @override
  Future<void> unsave(List<String> ids) async {}
}

class _NativeBrowse extends MetadataPluginBrowseEndpoint {
  final _CatalogApi api;
  _NativeBrowse(this.api) : super(_dummyHetu);

  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqBrowseSectionObject<Object>>>
      sections({int? offset, int? limit}) async {
    if (!api.isConfigured) return _page(const []);
    final d = await api.home();
    final sections = <DeeMusiqBrowseSectionObject<Object>>[];
    for (final s in _list(d["sections"])) {
      final type = s["type"];
      final items = _list(s["items"]);
      final List<Object> mapped;
      switch (type) {
        case "tracks":
          mapped = items.map(_track).toList();
          break;
        case "albums":
          mapped = items.map(_simpleAlbum).toList();
          break;
        case "artists":
          mapped = items.map(_fullArtist).toList();
          break;
        case "playlists":
          mapped = items.map(_simplePlaylist).toList();
          break;
        default:
          mapped = const [];
      }
      sections.add(DeeMusiqBrowseSectionObject<Object>(
        id: (s["id"] ?? "").toString(),
        title: (s["title"] ?? "").toString(),
        externalUri: "deemusiq:section:${s["id"] ?? ""}",
        browseMore: false,
        items: mapped,
      ));
    }
    return _page(sections);
  }

  @override
  Future<DeeMusiqPaginationResponseObject<Object>> sectionItems(String id,
          {int? offset, int? limit}) async =>
      _page(const []);
}

class _NativeUser extends MetadataPluginUserEndpoint {
  _NativeUser() : super(_dummyHetu);

  @override
  Future<DeeMusiqUserObject> me() async => _deemusiqOwner;
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>> savedTracks(
          {int? offset, int? limit}) async =>
      _page(const []);
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimplePlaylistObject>>
      savedPlaylists({int? offset, int? limit}) async => _page(const []);
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>>
      savedAlbums({int? offset, int? limit}) async => _page(const []);
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>>
      savedArtists({int? offset, int? limit}) async => _page(const []);
  @override
  Future<bool> isSavedPlaylist(String playlistId) async => false;
  @override
  Future<List<bool>> isSavedTracks(List<String> ids) async =>
      List.filled(ids.length, false);
  @override
  Future<List<bool>> isSavedAlbums(List<String> ids) async =>
      List.filled(ids.length, false);
  @override
  Future<List<bool>> isSavedArtists(List<String> ids) async =>
      List.filled(ids.length, false);
}

class _NativeAuth extends MetadataAuthEndpoint {
  _NativeAuth() : super(_dummyHetu);

  // Typed as raw `Stream` to match the base getter's return type exactly
  // (a `Stream<dynamic>` literal is rejected as an invalid override).
  final Stream _authState = const Stream.empty();

  @override
  Future<void> authenticate() async {}
  @override
  bool isAuthenticated() => true; // no external login — the catalog is public
  @override
  Future<void> logout() async {}
  @override
  // ignore: invalid_override
  Stream<dynamic> get authStateStream => _authState;
}

class _NativeCore extends MetadataPluginCore {
  _NativeCore() : super(_dummyHetu);

  @override
  Future<PluginUpdateAvailable?> checkUpdate(PluginConfiguration pluginConfig) async =>
      null;
  @override
  Future<String> get support async => "";
  @override
  Future<void> scrobble(Map<String, dynamic> details) async {}
}

class _NativeAudioSource extends MetadataPluginAudioSourceEndpoint {
  final YouTubeEngine youtubeEngine;
  _NativeAudioSource(this.youtubeEngine) : super(_dummyHetu);

  @override
  List<DeeMusiqAudioSourceContainerPreset> get supportedPresets => [
        DeeMusiqAudioSourceContainerPreset.lossy(
          type: DeeMusiqMediaCompressionType.lossy,
          name: "Audio",
          qualities: [
            DeeMusiqAudioLossyContainerQuality(bitrate: 320000),
            DeeMusiqAudioLossyContainerQuality(bitrate: 160000),
            DeeMusiqAudioLossyContainerQuality(bitrate: 96000),
          ],
        ),
      ];

  @override
  Future<List<DeeMusiqAudioSourceMatchObject>> matches(
      DeeMusiqFullTrackObject track) async {
    final uri = track.externalUri;
    if (uri.isEmpty) return const [];
    return [
      DeeMusiqAudioSourceMatchObject(
        id: track.id,
        title: track.name,
        artists: track.artists.map((a) => a.name).toList(),
        duration: Duration(milliseconds: track.durationMs),
        thumbnail: track.album.images.isNotEmpty
            ? track.album.images.first.url
            : null,
        externalUri: uri,
      ),
    ];
  }

  @override
  Future<List<DeeMusiqAudioSourceStreamObject>> streams(
      DeeMusiqAudioSourceMatchObject match) async {
    final uri = match.externalUri;
    if (uri.startsWith(_ytPrefix)) {
      final videoId = uri.substring(_ytPrefix.length);
      final manifest = await youtubeEngine.getStreamManifest(videoId);
      return manifest.audioOnly
          .map(
            (s) => DeeMusiqAudioSourceStreamObject(
              url: s.url.toString(),
              container: s.container.name,
              type: DeeMusiqMediaCompressionType.lossy,
              bitrate: s.bitrate.bitsPerSecond.toDouble(),
            ),
          )
          .toList();
    }
    if (uri.startsWith(_urlPrefix)) {
      final url = uri.substring(_urlPrefix.length);
      return [
        DeeMusiqAudioSourceStreamObject(
          url: url,
          container: url.split(".").last.split("?").first,
          type: DeeMusiqMediaCompressionType.lossy,
        ),
      ];
    }
    return const [];
  }
}

/// Wires the native endpoints onto a [MetadataPlugin]-shaped object. Used by the
/// `MetadataPlugin.native` constructor.
class DeeMusiqNativeEndpoints {
  final _CatalogApi _api = _CatalogApi();
  late final MetadataAuthEndpoint auth = _NativeAuth();
  late final MetadataPluginAudioSourceEndpoint audioSource;
  late final MetadataPluginAlbumEndpoint album = _NativeAlbum(_api);
  late final MetadataPluginArtistEndpoint artist = _NativeArtist(_api);
  late final MetadataPluginBrowseEndpoint browse = _NativeBrowse(_api);
  late final MetadataPluginSearchEndpoint search = _NativeSearch(_api);
  late final MetadataPluginPlaylistEndpoint playlist = _NativePlaylist(_api);
  late final MetadataPluginTrackEndpoint track = _NativeTrack(_api);
  late final MetadataPluginUserEndpoint user = _NativeUser();
  late final MetadataPluginCore core = _NativeCore();

  DeeMusiqNativeEndpoints(YouTubeEngine youtubeEngine) {
    audioSource = _NativeAudioSource(youtubeEngine);
  }
}
