part of '../database.dart';

class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) {
    return Color(fromDb);
  }

  @override
  int toSql(Color value) {
    return value.toARGB32();
  }
}

class DeeMusiqColorConverter extends TypeConverter<DeeMusiqColor, String> {
  const DeeMusiqColorConverter();

  @override
  DeeMusiqColor fromSql(String fromDb) {
    return DeeMusiqColor.fromString(fromDb);
  }

  @override
  String toSql(DeeMusiqColor value) {
    return value.toString();
  }
}
