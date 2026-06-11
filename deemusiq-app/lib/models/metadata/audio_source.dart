part of 'metadata.dart';

final oneOptionalDecimalFormatter = NumberFormat('0.#', 'en_US');

enum DeeMusiqMediaCompressionType {
  lossy,
  lossless,
}

@Freezed(unionKey: 'type')
class DeeMusiqAudioSourceContainerPreset
    with _$DeeMusiqAudioSourceContainerPreset {
  const DeeMusiqAudioSourceContainerPreset._();

  @FreezedUnionValue("lossy")
  factory DeeMusiqAudioSourceContainerPreset.lossy({
    required DeeMusiqMediaCompressionType type,
    required String name,
    required List<DeeMusiqAudioLossyContainerQuality> qualities,
  }) = DeeMusiqAudioSourceContainerPresetLossy;

  @FreezedUnionValue("lossless")
  factory DeeMusiqAudioSourceContainerPreset.lossless({
    required DeeMusiqMediaCompressionType type,
    required String name,
    required List<DeeMusiqAudioLosslessContainerQuality> qualities,
  }) = DeeMusiqAudioSourceContainerPresetLossless;

  factory DeeMusiqAudioSourceContainerPreset.fromJson(
          Map<String, dynamic> json) =>
      _$DeeMusiqAudioSourceContainerPresetFromJson(json);

  String getFileExtension() {
    return switch (name) {
      "mp4" => "m4a",
      "webm" => "weba",
      _ => name,
    };
  }
}

@freezed
class DeeMusiqAudioLossyContainerQuality
    with _$DeeMusiqAudioLossyContainerQuality {
  const DeeMusiqAudioLossyContainerQuality._();

  factory DeeMusiqAudioLossyContainerQuality({
    required int bitrate, // bits per second
  }) = _DeeMusiqAudioLossyContainerQuality;

  factory DeeMusiqAudioLossyContainerQuality.fromJson(
          Map<String, dynamic> json) =>
      _$DeeMusiqAudioLossyContainerQualityFromJson(json);

  @override
  toString() {
    return "${oneOptionalDecimalFormatter.format(bitrate / 1000)}kbps";
  }
}

@freezed
class DeeMusiqAudioLosslessContainerQuality
    with _$DeeMusiqAudioLosslessContainerQuality {
  const DeeMusiqAudioLosslessContainerQuality._();

  factory DeeMusiqAudioLosslessContainerQuality({
    required int bitDepth, // bit
    required int sampleRate, // hz
  }) = _DeeMusiqAudioLosslessContainerQuality;

  factory DeeMusiqAudioLosslessContainerQuality.fromJson(
          Map<String, dynamic> json) =>
      _$DeeMusiqAudioLosslessContainerQualityFromJson(json);

  @override
  toString() {
    return "${bitDepth}bit • ${oneOptionalDecimalFormatter.format(sampleRate / 1000)}kHz";
  }
}

@freezed
class DeeMusiqAudioSourceMatchObject with _$DeeMusiqAudioSourceMatchObject {
  factory DeeMusiqAudioSourceMatchObject({
    required String id,
    required String title,
    required List<String> artists,
    required Duration duration,
    String? thumbnail,
    required String externalUri,
  }) = _DeeMusiqAudioSourceMatchObject;

  factory DeeMusiqAudioSourceMatchObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqAudioSourceMatchObjectFromJson(json);
}

@freezed
class DeeMusiqAudioSourceStreamObject with _$DeeMusiqAudioSourceStreamObject {
  factory DeeMusiqAudioSourceStreamObject({
    required String url,
    required String container,
    required DeeMusiqMediaCompressionType type,
    String? codec,
    double? bitrate,
    int? bitDepth,
    double? sampleRate,
  }) = _DeeMusiqAudioSourceStreamObject;

  factory DeeMusiqAudioSourceStreamObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqAudioSourceStreamObjectFromJson(json);
}
