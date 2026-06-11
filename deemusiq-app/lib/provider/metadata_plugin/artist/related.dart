import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/family_paginated.dart';

class MetadataPluginArtistRelatedArtistsNotifier
    extends FamilyPaginatedAsyncNotifier<DeeMusiqFullArtistObject, String> {
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>> fetch(
    int offset,
    int limit,
  ) async {
    return await (await metadataPlugin).artist.related(
          arg,
          limit: limit,
          offset: offset,
        );
  }

  @override
  build(arg) async {
    ref.watch(metadataPluginProvider);
    return await fetch(0, 20);
  }
}

final metadataPluginArtistRelatedArtistsProvider = AsyncNotifierProviderFamily<
    MetadataPluginArtistRelatedArtistsNotifier,
    DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>,
    String>(
  () => MetadataPluginArtistRelatedArtistsNotifier(),
);
