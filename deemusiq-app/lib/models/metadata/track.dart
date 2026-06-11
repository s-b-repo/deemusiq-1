part of 'metadata.dart';

@freezed
class DeeMusiqTrackObject with _$DeeMusiqTrackObject {
  factory DeeMusiqTrackObject.local({
    required String id,
    required String name,
    required String externalUri,
    @Default([]) List<DeeMusiqSimpleArtistObject> artists,
    required DeeMusiqSimpleAlbumObject album,
    required int durationMs,
    required String path,
  }) = DeeMusiqLocalTrackObject;

  factory DeeMusiqTrackObject.full({
    required String id,
    required String name,
    required String externalUri,
    @Default([]) List<DeeMusiqSimpleArtistObject> artists,
    required DeeMusiqSimpleAlbumObject album,
    required int durationMs,
    required String isrc,
    required bool explicit,
  }) = DeeMusiqFullTrackObject;

  factory DeeMusiqTrackObject.localTrackFromFile(
    File file, {
    Metadata? metadata,
    String? art,
  }) {
    return DeeMusiqLocalTrackObject(
      id: file.absolute.path,
      name: metadata?.title ?? basenameWithoutExtension(file.path),
      externalUri: "file://${file.absolute.path}",
      artists: metadata?.artist?.split(",").map((a) {
            return DeeMusiqSimpleArtistObject(
              id: a.trim(),
              name: a.trim(),
              externalUri: "file://${file.absolute.path}",
            );
          }).toList() ??
          [
            DeeMusiqSimpleArtistObject(
              id: "unknown",
              name: "Unknown Artist",
              externalUri: "file://${file.absolute.path}",
            ),
          ],
      album: DeeMusiqSimpleAlbumObject(
        albumType: DeeMusiqAlbumType.album,
        id: metadata?.album ?? "unknown",
        name: metadata?.album ?? "Unknown Album",
        externalUri: "file://${file.absolute.path}",
        artists: [
          DeeMusiqSimpleArtistObject(
            id: metadata?.albumArtist ?? "unknown",
            name: metadata?.albumArtist ?? "Unknown Artist",
            externalUri: "file://${file.absolute.path}",
          ),
        ],
        releaseDate:
            metadata?.year != null ? "${metadata!.year}-01-01" : "1970-01-01",
        images: [
          if (art != null)
            DeeMusiqImageObject(
              url: art,
              width: 300,
              height: 300,
            ),
        ],
      ),
      durationMs: metadata?.durationMs?.toInt() ?? 0,
      path: file.path,
    );
  }

  factory DeeMusiqTrackObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqTrackObjectFromJson(
        json.containsKey("path")
            ? {...json, "runtimeType": "local"}
            : {...json, "runtimeType": "full"},
      );
}

extension AsMediaListDeeMusiqTrackObject on Iterable<DeeMusiqTrackObject> {
  List<DeeMusiqMedia> asMediaList() {
    return map((track) => DeeMusiqMedia(track)).toList();
  }
}

extension ToMetadataDeeMusiqFullTrackObject on DeeMusiqFullTrackObject {
  Metadata toMetadata({
    required int fileLength,
    Uint8List? imageBytes,
    String? mimeType,
  }) {
    return Metadata(
      title: name,
      artist: artists.map((a) => a.name).join(", "),
      album: album.name,
      albumArtist: artists.map((a) => a.name).join(", "),
      year: album.releaseDate == null
          ? 1970
          : DateTime.tryParse(album.releaseDate!)?.year ??
              int.tryParse(album.releaseDate!) ??
              1970,
      durationMs: durationMs.toDouble(),
      fileSize: BigInt.from(fileLength),
      picture: imageBytes != null
          ? Picture(
              data: imageBytes,
              mimeType: mimeType ??
                  lookupMimeType("", headerBytes: imageBytes) ??
                  "image/jpeg",
            )
          : null,
    );
  }
}
