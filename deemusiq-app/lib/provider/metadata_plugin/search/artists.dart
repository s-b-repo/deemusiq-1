import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/common.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/family_paginated.dart';

class MetadataPluginSearchArtistsNotifier
    extends AutoDisposeFamilyPaginatedAsyncNotifier<DeeMusiqFullArtistObject,
        String> {
  MetadataPluginSearchArtistsNotifier() : super();

  @override
  fetch(offset, limit) async {
    if (arg.isEmpty) {
      return DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>(
        limit: limit,
        nextOffset: null,
        total: 0,
        items: [],
        hasMore: false,
      );
    }

    final res = await (await metadataPlugin).search.artists(
          arg,
          offset: offset,
          limit: limit,
        );

    return res;
  }

  @override
  build(arg) async {
    ref.cacheFor();

    ref.watch(metadataPluginProvider);
    return await fetch(0, 20);
  }
}

final metadataPluginSearchArtistsProvider =
    AutoDisposeAsyncNotifierProviderFamily<MetadataPluginSearchArtistsNotifier,
        DeeMusiqPaginationResponseObject<DeeMusiqFullArtistObject>, String>(
  () => MetadataPluginSearchArtistsNotifier(),
);
