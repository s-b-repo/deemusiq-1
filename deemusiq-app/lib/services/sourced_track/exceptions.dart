import 'package:deemusiq/models/metadata/metadata.dart';

class TrackNotFoundError extends Error {
  final DeeMusiqTrackObject track;

  TrackNotFoundError(this.track);

  @override
  String toString() {
    return '[TrackNotFoundError] ${track.name} - ${track.artists.join(", ")}';
  }
}
