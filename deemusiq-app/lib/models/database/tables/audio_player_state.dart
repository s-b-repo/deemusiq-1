part of '../database.dart';

class AudioPlayerStateTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get playing => boolean()();
  TextColumn get loopMode => textEnum<PlaylistMode>()();
  BoolColumn get shuffled => boolean()();
  TextColumn get collections => text().map(const StringListConverter())();
  TextColumn get tracks => text()
      .map(const DeeMusiqTrackObjectListConverter())
      .withDefault(const Constant("[]"))();
  IntColumn get currentIndex => integer().withDefault(const Constant(0))();
}

class DeeMusiqTrackObjectListConverter
    extends TypeConverter<List<DeeMusiqTrackObject>, String> {
  const DeeMusiqTrackObjectListConverter();

  @override
  List<DeeMusiqTrackObject> fromSql(String fromDb) {
    final raw = (jsonDecode(fromDb) as List).cast<Map>();

    return raw
        .map((e) => DeeMusiqTrackObject.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  @override
  String toSql(List<DeeMusiqTrackObject> value) {
    return jsonEncode(
      value.map((e) => e.toJson()).toList(),
    );
  }
}
