part of '../database.dart';

enum HistoryEntryType {
  playlist,
  album,
  track,
}

class HistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get type => textEnum<HistoryEntryType>()();
  TextColumn get itemId => text()();
  TextColumn get data =>
      text().map(const MapTypeConverter<String, dynamic>())();
}

extension HistoryItemParseExtension on HistoryTableData {
  DeeMusiqSimplePlaylistObject? get playlist =>
      type == HistoryEntryType.playlist && !data.containsKey("external_urls")
          ? DeeMusiqSimplePlaylistObject.fromJson(data)
          : null;
  DeeMusiqSimpleAlbumObject? get album =>
      type == HistoryEntryType.album && !data.containsKey("external_urls")
          ? DeeMusiqSimpleAlbumObject.fromJson(data)
          : null;
  DeeMusiqTrackObject? get track =>
      type == HistoryEntryType.track && !data.containsKey("external_urls")
          ? DeeMusiqTrackObject.fromJson(data)
          : null;
}
