import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/family_paginated.dart';

class MetadataPluginArtistAlbumNotifier
    extends FamilyPaginatedAsyncNotifier<DeeMusiqSimpleAlbumObject, String> {
  @override
  Future<DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>> fetch(
    int offset,
    int limit,
  ) async {
    return await (await metadataPlugin).artist.albums(
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

final metadataPluginArtistAlbumsProvider = AsyncNotifierProviderFamily<
    MetadataPluginArtistAlbumNotifier,
    DeeMusiqPaginationResponseObject<DeeMusiqSimpleAlbumObject>,
    String>(
  () => MetadataPluginArtistAlbumNotifier(),
);
