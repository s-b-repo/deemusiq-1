import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

class MetadataPluginAudioSourceEndpoint {
  final Hetu hetu;
  MetadataPluginAudioSourceEndpoint(this.hetu);

  HTInstance get hetuMetadataAudioSource =>
      (hetu.fetch("metadataPlugin") as HTInstance).memberGet("audioSource")
          as HTInstance;

  List<DeeMusiqAudioSourceContainerPreset> get supportedPresets {
    final raw = hetuMetadataAudioSource.memberGet("supportedPresets") as List;

    return raw
        .map((e) => DeeMusiqAudioSourceContainerPreset.fromJson(e))
        .toList();
  }

  Future<List<DeeMusiqAudioSourceMatchObject>> matches(
    DeeMusiqFullTrackObject track,
  ) async {
    final raw = await hetuMetadataAudioSource
        .invoke("matches", positionalArgs: [track.toJson()]) as List;

    return raw.map((e) => DeeMusiqAudioSourceMatchObject.fromJson(e)).toList();
  }

  Future<List<DeeMusiqAudioSourceStreamObject>> streams(
    DeeMusiqAudioSourceMatchObject match,
  ) async {
    final raw = await hetuMetadataAudioSource
        .invoke("streams", positionalArgs: [match.toJson()]) as List;

    return raw.map((e) => DeeMusiqAudioSourceStreamObject.fromJson(e)).toList();
  }
}
