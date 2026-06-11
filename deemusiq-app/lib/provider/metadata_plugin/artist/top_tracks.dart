import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/family_paginated.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/common.dart';

class MetadataPluginArtistTopTracksNotifier
    extends AutoDisposeFamilyPaginatedAsyncNotifier<DeeMusiqFullTrackObject,
        String> {
  MetadataPluginArtistTopTracksNotifier() : super();

  @override
  fetch(offset, limit) async {
    final tracks = await (await metadataPlugin).artist.topTracks(
          arg,
          offset: offset,
          limit: limit,
        );

    return tracks;
  }

  @override
  build(arg) async {
    ref.cacheFor();

    ref.watch(metadataPluginProvider);
    return await fetch(0, 20);
  }
}

final metadataPluginArtistTopTracksProvider =
    AutoDisposeAsyncNotifierProviderFamily<
        MetadataPluginArtistTopTracksNotifier,
        DeeMusiqPaginationResponseObject<DeeMusiqFullTrackObject>,
        String>(
  () => MetadataPluginArtistTopTracksNotifier(),
);
