import 'dart:convert';

import 'package:drift/drift.dart' show Value, InsertMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deemusiq/models/database/database.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/database/database.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/services/wallet/wallet_api.dart';

/// The DeeMusiq catalog: the platform's own songs, each an UNLISTED YouTube
/// video served by the backend. Each row is mapped to a playable
/// [DeeMusiqFullTrackObject], and the app's source-match cache is SEEDED with
/// the unlisted videoId so the existing YouTube engine resolves it directly
/// (no title search, no plugin fork). After that, play / queue / download /
/// "Push this song" all work through the normal track widgets.
final catalogProvider =
    FutureProvider<List<DeeMusiqFullTrackObject>>((ref) async {
  if (!WalletApiClient.instance.isConfigured) return const [];

  final res = await WalletApiClient.instance.fetchCatalog(limit: 50);
  final items = (res["items"] as List? ?? const []);

  final db = ref.read(databaseProvider);
  final audioCfg = await ref.read(
    metadataPluginsProvider.selectAsync((d) => d.defaultAudioSourcePluginConfig),
  );

  final tracks = <DeeMusiqFullTrackObject>[];
  for (final raw in items) {
    final s = Map<String, dynamic>.from(raw as Map);
    final id = s["id"] as String;
    final title = s["title"] as String;
    final artist = s["artistName"] as String;
    final youtubeId = s["youtubeId"] as String;
    final cover = s["coverUrl"] as String?;
    final durationMs = (s["durationMs"] as int?) ?? 0;
    final ytUri = "https://www.youtube.com/watch?v=$youtubeId";

    // Seed the source-match cache: trackId -> the exact unlisted videoId.
    // insertOrIgnore so we never clobber a user's sibling swap.
    if (audioCfg != null) {
      final match = DeeMusiqAudioSourceMatchObject(
        id: youtubeId,
        title: title,
        artists: [artist],
        duration: Duration(milliseconds: durationMs),
        thumbnail: cover,
        externalUri: ytUri,
      );
      await db.into(db.sourceMatchTable).insert(
            SourceMatchTableCompanion.insert(
              trackId: id,
              sourceInfo: Value(jsonEncode(match)),
              sourceType: audioCfg.slug,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }

    tracks.add(
      DeeMusiqTrackObject.full(
        id: id,
        name: title,
        externalUri: ytUri,
        artists: [
          DeeMusiqSimpleArtistObject(
            id: (s["artistId"] as String?) ?? artist,
            name: artist,
            externalUri: "",
            images: null,
          ),
        ],
        album: DeeMusiqSimpleAlbumObject(
          albumType: DeeMusiqAlbumType.single,
          artists: const [],
          externalUri: ytUri,
          id: id,
          name: title,
          releaseDate: s["releaseDate"] as String?,
          images: cover != null
              ? [DeeMusiqImageObject(height: 300, width: 300, url: cover)]
              : const [],
        ),
        durationMs: durationMs,
        isrc: "",
        explicit: false,
      ) as DeeMusiqFullTrackObject,
    );
  }
  return tracks;
});
