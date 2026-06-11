import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deemusiq/models/metadata/metadata.dart';

part 'track_sources.g.dart';

@JsonSerializable()
class BasicSourcedTrack {
  final DeeMusiqFullTrackObject query;
  final DeeMusiqAudioSourceMatchObject info;
  final String source;
  final List<DeeMusiqAudioSourceStreamObject> sources;
  final List<DeeMusiqAudioSourceMatchObject> siblings;
  BasicSourcedTrack({
    required this.query,
    required this.source,
    required this.info,
    required this.sources,
    this.siblings = const [],
  });

  factory BasicSourcedTrack.fromJson(Map<String, dynamic> json) =>
      _$BasicSourcedTrackFromJson(json);
  Map<String, dynamic> toJson() => _$BasicSourcedTrackToJson(this);
}
