import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/metadata_plugin_provider.dart';
import 'package:deemusiq/provider/metadata_plugin/utils/common.dart';
import 'package:deemusiq/services/metadata/errors/exceptions.dart';

final metadataPluginArtistProvider =
    FutureProvider.autoDispose.family<DeeMusiqFullArtistObject, String>(
  (ref, artistId) async {
    ref.cacheFor();

    final metadataPlugin = await ref.watch(metadataPluginProvider.future);

    if (metadataPlugin == null) {
      throw MetadataPluginException.noDefaultMetadataPlugin();
    }

    return metadataPlugin.artist.getArtist(artistId);
  },
);
