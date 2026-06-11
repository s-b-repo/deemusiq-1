// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeMusiqAudioSourceContainerPreset _$DeeMusiqAudioSourceContainerPresetFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'lossy':
      return DeeMusiqAudioSourceContainerPresetLossy.fromJson(json);
    case 'lossless':
      return DeeMusiqAudioSourceContainerPresetLossless.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'type',
          'DeeMusiqAudioSourceContainerPreset',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$DeeMusiqAudioSourceContainerPreset {
  DeeMusiqMediaCompressionType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Object> get qualities => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)
        lossy,
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)
        lossless,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)
        lossy,
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)
        lossless,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossless value)?
        lossless,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)? lossless,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqAudioSourceContainerPreset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqAudioSourceContainerPresetCopyWith<DeeMusiqAudioSourceContainerPreset>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqAudioSourceContainerPresetCopyWith<$Res> {
  factory $DeeMusiqAudioSourceContainerPresetCopyWith(
          DeeMusiqAudioSourceContainerPreset value,
          $Res Function(DeeMusiqAudioSourceContainerPreset) then) =
      _$DeeMusiqAudioSourceContainerPresetCopyWithImpl<$Res,
          DeeMusiqAudioSourceContainerPreset>;
  @useResult
  $Res call({DeeMusiqMediaCompressionType type, String name});
}

/// @nodoc
class _$DeeMusiqAudioSourceContainerPresetCopyWithImpl<$Res,
        $Val extends DeeMusiqAudioSourceContainerPreset>
    implements $DeeMusiqAudioSourceContainerPresetCopyWith<$Res> {
  _$DeeMusiqAudioSourceContainerPresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeeMusiqMediaCompressionType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWith<$Res>
    implements $DeeMusiqAudioSourceContainerPresetCopyWith<$Res> {
  factory _$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWith(
          _$DeeMusiqAudioSourceContainerPresetLossyImpl value,
          $Res Function(_$DeeMusiqAudioSourceContainerPresetLossyImpl) then) =
      __$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeeMusiqMediaCompressionType type,
      String name,
      List<DeeMusiqAudioLossyContainerQuality> qualities});
}

/// @nodoc
class __$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioSourceContainerPresetCopyWithImpl<$Res,
        _$DeeMusiqAudioSourceContainerPresetLossyImpl>
    implements _$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWith<$Res> {
  __$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWithImpl(
      _$DeeMusiqAudioSourceContainerPresetLossyImpl _value,
      $Res Function(_$DeeMusiqAudioSourceContainerPresetLossyImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? qualities = null,
  }) {
    return _then(_$DeeMusiqAudioSourceContainerPresetLossyImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeeMusiqMediaCompressionType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qualities: null == qualities
          ? _value._qualities
          : qualities // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqAudioLossyContainerQuality>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioSourceContainerPresetLossyImpl
    extends DeeMusiqAudioSourceContainerPresetLossy {
  _$DeeMusiqAudioSourceContainerPresetLossyImpl(
      {required this.type,
      required this.name,
      required final List<DeeMusiqAudioLossyContainerQuality> qualities})
      : _qualities = qualities,
        super._();

  factory _$DeeMusiqAudioSourceContainerPresetLossyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioSourceContainerPresetLossyImplFromJson(json);

  @override
  final DeeMusiqMediaCompressionType type;
  @override
  final String name;
  final List<DeeMusiqAudioLossyContainerQuality> _qualities;
  @override
  List<DeeMusiqAudioLossyContainerQuality> get qualities {
    if (_qualities is EqualUnmodifiableListView) return _qualities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qualities);
  }

  @override
  String toString() {
    return 'DeeMusiqAudioSourceContainerPreset.lossy(type: $type, name: $name, qualities: $qualities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioSourceContainerPresetLossyImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._qualities, _qualities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, name, const DeepCollectionEquality().hash(_qualities));

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWith<
          _$DeeMusiqAudioSourceContainerPresetLossyImpl>
      get copyWith =>
          __$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWithImpl<
              _$DeeMusiqAudioSourceContainerPresetLossyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)
        lossy,
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)
        lossless,
  }) {
    return lossy(type, name, qualities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
  }) {
    return lossy?.call(type, name, qualities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
    required TResult orElse(),
  }) {
    if (lossy != null) {
      return lossy(type, name, qualities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)
        lossy,
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)
        lossless,
  }) {
    return lossy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossless value)?
        lossless,
  }) {
    return lossy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)? lossless,
    required TResult orElse(),
  }) {
    if (lossy != null) {
      return lossy(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioSourceContainerPresetLossyImplToJson(
      this,
    );
  }
}

abstract class DeeMusiqAudioSourceContainerPresetLossy
    extends DeeMusiqAudioSourceContainerPreset {
  factory DeeMusiqAudioSourceContainerPresetLossy(
          {required final DeeMusiqMediaCompressionType type,
          required final String name,
          required final List<DeeMusiqAudioLossyContainerQuality> qualities}) =
      _$DeeMusiqAudioSourceContainerPresetLossyImpl;
  DeeMusiqAudioSourceContainerPresetLossy._() : super._();

  factory DeeMusiqAudioSourceContainerPresetLossy.fromJson(
          Map<String, dynamic> json) =
      _$DeeMusiqAudioSourceContainerPresetLossyImpl.fromJson;

  @override
  DeeMusiqMediaCompressionType get type;
  @override
  String get name;
  @override
  List<DeeMusiqAudioLossyContainerQuality> get qualities;

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioSourceContainerPresetLossyImplCopyWith<
          _$DeeMusiqAudioSourceContainerPresetLossyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWith<$Res>
    implements $DeeMusiqAudioSourceContainerPresetCopyWith<$Res> {
  factory _$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWith(
          _$DeeMusiqAudioSourceContainerPresetLosslessImpl value,
          $Res Function(_$DeeMusiqAudioSourceContainerPresetLosslessImpl) then) =
      __$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeeMusiqMediaCompressionType type,
      String name,
      List<DeeMusiqAudioLosslessContainerQuality> qualities});
}

/// @nodoc
class __$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioSourceContainerPresetCopyWithImpl<$Res,
        _$DeeMusiqAudioSourceContainerPresetLosslessImpl>
    implements _$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWith<$Res> {
  __$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWithImpl(
      _$DeeMusiqAudioSourceContainerPresetLosslessImpl _value,
      $Res Function(_$DeeMusiqAudioSourceContainerPresetLosslessImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? qualities = null,
  }) {
    return _then(_$DeeMusiqAudioSourceContainerPresetLosslessImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeeMusiqMediaCompressionType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qualities: null == qualities
          ? _value._qualities
          : qualities // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqAudioLosslessContainerQuality>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioSourceContainerPresetLosslessImpl
    extends DeeMusiqAudioSourceContainerPresetLossless {
  _$DeeMusiqAudioSourceContainerPresetLosslessImpl(
      {required this.type,
      required this.name,
      required final List<DeeMusiqAudioLosslessContainerQuality> qualities})
      : _qualities = qualities,
        super._();

  factory _$DeeMusiqAudioSourceContainerPresetLosslessImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioSourceContainerPresetLosslessImplFromJson(json);

  @override
  final DeeMusiqMediaCompressionType type;
  @override
  final String name;
  final List<DeeMusiqAudioLosslessContainerQuality> _qualities;
  @override
  List<DeeMusiqAudioLosslessContainerQuality> get qualities {
    if (_qualities is EqualUnmodifiableListView) return _qualities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qualities);
  }

  @override
  String toString() {
    return 'DeeMusiqAudioSourceContainerPreset.lossless(type: $type, name: $name, qualities: $qualities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioSourceContainerPresetLosslessImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._qualities, _qualities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, name, const DeepCollectionEquality().hash(_qualities));

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWith<
          _$DeeMusiqAudioSourceContainerPresetLosslessImpl>
      get copyWith =>
          __$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWithImpl<
                  _$DeeMusiqAudioSourceContainerPresetLosslessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)
        lossy,
    required TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)
        lossless,
  }) {
    return lossless(type, name, qualities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult? Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
  }) {
    return lossless?.call(type, name, qualities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLossyContainerQuality> qualities)?
        lossy,
    TResult Function(DeeMusiqMediaCompressionType type, String name,
            List<DeeMusiqAudioLosslessContainerQuality> qualities)?
        lossless,
    required TResult orElse(),
  }) {
    if (lossless != null) {
      return lossless(type, name, qualities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)
        lossy,
    required TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)
        lossless,
  }) {
    return lossless(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult? Function(DeeMusiqAudioSourceContainerPresetLossless value)?
        lossless,
  }) {
    return lossless?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqAudioSourceContainerPresetLossy value)? lossy,
    TResult Function(DeeMusiqAudioSourceContainerPresetLossless value)? lossless,
    required TResult orElse(),
  }) {
    if (lossless != null) {
      return lossless(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioSourceContainerPresetLosslessImplToJson(
      this,
    );
  }
}

abstract class DeeMusiqAudioSourceContainerPresetLossless
    extends DeeMusiqAudioSourceContainerPreset {
  factory DeeMusiqAudioSourceContainerPresetLossless(
      {required final DeeMusiqMediaCompressionType type,
      required final String name,
      required final List<DeeMusiqAudioLosslessContainerQuality>
          qualities}) = _$DeeMusiqAudioSourceContainerPresetLosslessImpl;
  DeeMusiqAudioSourceContainerPresetLossless._() : super._();

  factory DeeMusiqAudioSourceContainerPresetLossless.fromJson(
          Map<String, dynamic> json) =
      _$DeeMusiqAudioSourceContainerPresetLosslessImpl.fromJson;

  @override
  DeeMusiqMediaCompressionType get type;
  @override
  String get name;
  @override
  List<DeeMusiqAudioLosslessContainerQuality> get qualities;

  /// Create a copy of DeeMusiqAudioSourceContainerPreset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioSourceContainerPresetLosslessImplCopyWith<
          _$DeeMusiqAudioSourceContainerPresetLosslessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqAudioLossyContainerQuality _$DeeMusiqAudioLossyContainerQualityFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqAudioLossyContainerQuality.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqAudioLossyContainerQuality {
  int get bitrate => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqAudioLossyContainerQuality to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqAudioLossyContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqAudioLossyContainerQualityCopyWith<DeeMusiqAudioLossyContainerQuality>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqAudioLossyContainerQualityCopyWith<$Res> {
  factory $DeeMusiqAudioLossyContainerQualityCopyWith(
          DeeMusiqAudioLossyContainerQuality value,
          $Res Function(DeeMusiqAudioLossyContainerQuality) then) =
      _$DeeMusiqAudioLossyContainerQualityCopyWithImpl<$Res,
          DeeMusiqAudioLossyContainerQuality>;
  @useResult
  $Res call({int bitrate});
}

/// @nodoc
class _$DeeMusiqAudioLossyContainerQualityCopyWithImpl<$Res,
        $Val extends DeeMusiqAudioLossyContainerQuality>
    implements $DeeMusiqAudioLossyContainerQualityCopyWith<$Res> {
  _$DeeMusiqAudioLossyContainerQualityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqAudioLossyContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
  }) {
    return _then(_value.copyWith(
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqAudioLossyContainerQualityImplCopyWith<$Res>
    implements $DeeMusiqAudioLossyContainerQualityCopyWith<$Res> {
  factory _$$DeeMusiqAudioLossyContainerQualityImplCopyWith(
          _$DeeMusiqAudioLossyContainerQualityImpl value,
          $Res Function(_$DeeMusiqAudioLossyContainerQualityImpl) then) =
      __$$DeeMusiqAudioLossyContainerQualityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bitrate});
}

/// @nodoc
class __$$DeeMusiqAudioLossyContainerQualityImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioLossyContainerQualityCopyWithImpl<$Res,
        _$DeeMusiqAudioLossyContainerQualityImpl>
    implements _$$DeeMusiqAudioLossyContainerQualityImplCopyWith<$Res> {
  __$$DeeMusiqAudioLossyContainerQualityImplCopyWithImpl(
      _$DeeMusiqAudioLossyContainerQualityImpl _value,
      $Res Function(_$DeeMusiqAudioLossyContainerQualityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioLossyContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
  }) {
    return _then(_$DeeMusiqAudioLossyContainerQualityImpl(
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioLossyContainerQualityImpl
    extends _DeeMusiqAudioLossyContainerQuality {
  _$DeeMusiqAudioLossyContainerQualityImpl({required this.bitrate}) : super._();

  factory _$DeeMusiqAudioLossyContainerQualityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioLossyContainerQualityImplFromJson(json);

  @override
  final int bitrate;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioLossyContainerQualityImpl &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bitrate);

  /// Create a copy of DeeMusiqAudioLossyContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioLossyContainerQualityImplCopyWith<
          _$DeeMusiqAudioLossyContainerQualityImpl>
      get copyWith => __$$DeeMusiqAudioLossyContainerQualityImplCopyWithImpl<
          _$DeeMusiqAudioLossyContainerQualityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioLossyContainerQualityImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqAudioLossyContainerQuality
    extends DeeMusiqAudioLossyContainerQuality {
  factory _DeeMusiqAudioLossyContainerQuality({required final int bitrate}) =
      _$DeeMusiqAudioLossyContainerQualityImpl;
  _DeeMusiqAudioLossyContainerQuality._() : super._();

  factory _DeeMusiqAudioLossyContainerQuality.fromJson(
          Map<String, dynamic> json) =
      _$DeeMusiqAudioLossyContainerQualityImpl.fromJson;

  @override
  int get bitrate;

  /// Create a copy of DeeMusiqAudioLossyContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioLossyContainerQualityImplCopyWith<
          _$DeeMusiqAudioLossyContainerQualityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqAudioLosslessContainerQuality
    _$DeeMusiqAudioLosslessContainerQualityFromJson(Map<String, dynamic> json) {
  return _DeeMusiqAudioLosslessContainerQuality.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqAudioLosslessContainerQuality {
  int get bitDepth => throw _privateConstructorUsedError; // bit
  int get sampleRate => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqAudioLosslessContainerQuality to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqAudioLosslessContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqAudioLosslessContainerQualityCopyWith<
          DeeMusiqAudioLosslessContainerQuality>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqAudioLosslessContainerQualityCopyWith<$Res> {
  factory $DeeMusiqAudioLosslessContainerQualityCopyWith(
          DeeMusiqAudioLosslessContainerQuality value,
          $Res Function(DeeMusiqAudioLosslessContainerQuality) then) =
      _$DeeMusiqAudioLosslessContainerQualityCopyWithImpl<$Res,
          DeeMusiqAudioLosslessContainerQuality>;
  @useResult
  $Res call({int bitDepth, int sampleRate});
}

/// @nodoc
class _$DeeMusiqAudioLosslessContainerQualityCopyWithImpl<$Res,
        $Val extends DeeMusiqAudioLosslessContainerQuality>
    implements $DeeMusiqAudioLosslessContainerQualityCopyWith<$Res> {
  _$DeeMusiqAudioLosslessContainerQualityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqAudioLosslessContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitDepth = null,
    Object? sampleRate = null,
  }) {
    return _then(_value.copyWith(
      bitDepth: null == bitDepth
          ? _value.bitDepth
          : bitDepth // ignore: cast_nullable_to_non_nullable
              as int,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqAudioLosslessContainerQualityImplCopyWith<$Res>
    implements $DeeMusiqAudioLosslessContainerQualityCopyWith<$Res> {
  factory _$$DeeMusiqAudioLosslessContainerQualityImplCopyWith(
          _$DeeMusiqAudioLosslessContainerQualityImpl value,
          $Res Function(_$DeeMusiqAudioLosslessContainerQualityImpl) then) =
      __$$DeeMusiqAudioLosslessContainerQualityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bitDepth, int sampleRate});
}

/// @nodoc
class __$$DeeMusiqAudioLosslessContainerQualityImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioLosslessContainerQualityCopyWithImpl<$Res,
        _$DeeMusiqAudioLosslessContainerQualityImpl>
    implements _$$DeeMusiqAudioLosslessContainerQualityImplCopyWith<$Res> {
  __$$DeeMusiqAudioLosslessContainerQualityImplCopyWithImpl(
      _$DeeMusiqAudioLosslessContainerQualityImpl _value,
      $Res Function(_$DeeMusiqAudioLosslessContainerQualityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioLosslessContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitDepth = null,
    Object? sampleRate = null,
  }) {
    return _then(_$DeeMusiqAudioLosslessContainerQualityImpl(
      bitDepth: null == bitDepth
          ? _value.bitDepth
          : bitDepth // ignore: cast_nullable_to_non_nullable
              as int,
      sampleRate: null == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioLosslessContainerQualityImpl
    extends _DeeMusiqAudioLosslessContainerQuality {
  _$DeeMusiqAudioLosslessContainerQualityImpl(
      {required this.bitDepth, required this.sampleRate})
      : super._();

  factory _$DeeMusiqAudioLosslessContainerQualityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioLosslessContainerQualityImplFromJson(json);

  @override
  final int bitDepth;
// bit
  @override
  final int sampleRate;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioLosslessContainerQualityImpl &&
            (identical(other.bitDepth, bitDepth) ||
                other.bitDepth == bitDepth) &&
            (identical(other.sampleRate, sampleRate) ||
                other.sampleRate == sampleRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bitDepth, sampleRate);

  /// Create a copy of DeeMusiqAudioLosslessContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioLosslessContainerQualityImplCopyWith<
          _$DeeMusiqAudioLosslessContainerQualityImpl>
      get copyWith => __$$DeeMusiqAudioLosslessContainerQualityImplCopyWithImpl<
          _$DeeMusiqAudioLosslessContainerQualityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioLosslessContainerQualityImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqAudioLosslessContainerQuality
    extends DeeMusiqAudioLosslessContainerQuality {
  factory _DeeMusiqAudioLosslessContainerQuality(
          {required final int bitDepth, required final int sampleRate}) =
      _$DeeMusiqAudioLosslessContainerQualityImpl;
  _DeeMusiqAudioLosslessContainerQuality._() : super._();

  factory _DeeMusiqAudioLosslessContainerQuality.fromJson(
          Map<String, dynamic> json) =
      _$DeeMusiqAudioLosslessContainerQualityImpl.fromJson;

  @override
  int get bitDepth; // bit
  @override
  int get sampleRate;

  /// Create a copy of DeeMusiqAudioLosslessContainerQuality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioLosslessContainerQualityImplCopyWith<
          _$DeeMusiqAudioLosslessContainerQualityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqAudioSourceMatchObject _$DeeMusiqAudioSourceMatchObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqAudioSourceMatchObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqAudioSourceMatchObject {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get artists => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqAudioSourceMatchObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqAudioSourceMatchObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqAudioSourceMatchObjectCopyWith<DeeMusiqAudioSourceMatchObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqAudioSourceMatchObjectCopyWith<$Res> {
  factory $DeeMusiqAudioSourceMatchObjectCopyWith(
          DeeMusiqAudioSourceMatchObject value,
          $Res Function(DeeMusiqAudioSourceMatchObject) then) =
      _$DeeMusiqAudioSourceMatchObjectCopyWithImpl<$Res,
          DeeMusiqAudioSourceMatchObject>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> artists,
      Duration duration,
      String? thumbnail,
      String externalUri});
}

/// @nodoc
class _$DeeMusiqAudioSourceMatchObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqAudioSourceMatchObject>
    implements $DeeMusiqAudioSourceMatchObjectCopyWith<$Res> {
  _$DeeMusiqAudioSourceMatchObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqAudioSourceMatchObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artists = null,
    Object? duration = null,
    Object? thumbnail = freezed,
    Object? externalUri = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqAudioSourceMatchObjectImplCopyWith<$Res>
    implements $DeeMusiqAudioSourceMatchObjectCopyWith<$Res> {
  factory _$$DeeMusiqAudioSourceMatchObjectImplCopyWith(
          _$DeeMusiqAudioSourceMatchObjectImpl value,
          $Res Function(_$DeeMusiqAudioSourceMatchObjectImpl) then) =
      __$$DeeMusiqAudioSourceMatchObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> artists,
      Duration duration,
      String? thumbnail,
      String externalUri});
}

/// @nodoc
class __$$DeeMusiqAudioSourceMatchObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioSourceMatchObjectCopyWithImpl<$Res,
        _$DeeMusiqAudioSourceMatchObjectImpl>
    implements _$$DeeMusiqAudioSourceMatchObjectImplCopyWith<$Res> {
  __$$DeeMusiqAudioSourceMatchObjectImplCopyWithImpl(
      _$DeeMusiqAudioSourceMatchObjectImpl _value,
      $Res Function(_$DeeMusiqAudioSourceMatchObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioSourceMatchObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artists = null,
    Object? duration = null,
    Object? thumbnail = freezed,
    Object? externalUri = null,
  }) {
    return _then(_$DeeMusiqAudioSourceMatchObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioSourceMatchObjectImpl
    implements _DeeMusiqAudioSourceMatchObject {
  _$DeeMusiqAudioSourceMatchObjectImpl(
      {required this.id,
      required this.title,
      required final List<String> artists,
      required this.duration,
      this.thumbnail,
      required this.externalUri})
      : _artists = artists;

  factory _$DeeMusiqAudioSourceMatchObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioSourceMatchObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _artists;
  @override
  List<String> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final Duration duration;
  @override
  final String? thumbnail;
  @override
  final String externalUri;

  @override
  String toString() {
    return 'DeeMusiqAudioSourceMatchObject(id: $id, title: $title, artists: $artists, duration: $duration, thumbnail: $thumbnail, externalUri: $externalUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioSourceMatchObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_artists),
      duration,
      thumbnail,
      externalUri);

  /// Create a copy of DeeMusiqAudioSourceMatchObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioSourceMatchObjectImplCopyWith<
          _$DeeMusiqAudioSourceMatchObjectImpl>
      get copyWith => __$$DeeMusiqAudioSourceMatchObjectImplCopyWithImpl<
          _$DeeMusiqAudioSourceMatchObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioSourceMatchObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqAudioSourceMatchObject
    implements DeeMusiqAudioSourceMatchObject {
  factory _DeeMusiqAudioSourceMatchObject(
      {required final String id,
      required final String title,
      required final List<String> artists,
      required final Duration duration,
      final String? thumbnail,
      required final String externalUri}) = _$DeeMusiqAudioSourceMatchObjectImpl;

  factory _DeeMusiqAudioSourceMatchObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqAudioSourceMatchObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get artists;
  @override
  Duration get duration;
  @override
  String? get thumbnail;
  @override
  String get externalUri;

  /// Create a copy of DeeMusiqAudioSourceMatchObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioSourceMatchObjectImplCopyWith<
          _$DeeMusiqAudioSourceMatchObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqAudioSourceStreamObject _$DeeMusiqAudioSourceStreamObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqAudioSourceStreamObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqAudioSourceStreamObject {
  String get url => throw _privateConstructorUsedError;
  String get container => throw _privateConstructorUsedError;
  DeeMusiqMediaCompressionType get type => throw _privateConstructorUsedError;
  String? get codec => throw _privateConstructorUsedError;
  double? get bitrate => throw _privateConstructorUsedError;
  int? get bitDepth => throw _privateConstructorUsedError;
  double? get sampleRate => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqAudioSourceStreamObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqAudioSourceStreamObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqAudioSourceStreamObjectCopyWith<DeeMusiqAudioSourceStreamObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqAudioSourceStreamObjectCopyWith<$Res> {
  factory $DeeMusiqAudioSourceStreamObjectCopyWith(
          DeeMusiqAudioSourceStreamObject value,
          $Res Function(DeeMusiqAudioSourceStreamObject) then) =
      _$DeeMusiqAudioSourceStreamObjectCopyWithImpl<$Res,
          DeeMusiqAudioSourceStreamObject>;
  @useResult
  $Res call(
      {String url,
      String container,
      DeeMusiqMediaCompressionType type,
      String? codec,
      double? bitrate,
      int? bitDepth,
      double? sampleRate});
}

/// @nodoc
class _$DeeMusiqAudioSourceStreamObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqAudioSourceStreamObject>
    implements $DeeMusiqAudioSourceStreamObjectCopyWith<$Res> {
  _$DeeMusiqAudioSourceStreamObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqAudioSourceStreamObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? container = null,
    Object? type = null,
    Object? codec = freezed,
    Object? bitrate = freezed,
    Object? bitDepth = freezed,
    Object? sampleRate = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeeMusiqMediaCompressionType,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as double?,
      bitDepth: freezed == bitDepth
          ? _value.bitDepth
          : bitDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleRate: freezed == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqAudioSourceStreamObjectImplCopyWith<$Res>
    implements $DeeMusiqAudioSourceStreamObjectCopyWith<$Res> {
  factory _$$DeeMusiqAudioSourceStreamObjectImplCopyWith(
          _$DeeMusiqAudioSourceStreamObjectImpl value,
          $Res Function(_$DeeMusiqAudioSourceStreamObjectImpl) then) =
      __$$DeeMusiqAudioSourceStreamObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String container,
      DeeMusiqMediaCompressionType type,
      String? codec,
      double? bitrate,
      int? bitDepth,
      double? sampleRate});
}

/// @nodoc
class __$$DeeMusiqAudioSourceStreamObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqAudioSourceStreamObjectCopyWithImpl<$Res,
        _$DeeMusiqAudioSourceStreamObjectImpl>
    implements _$$DeeMusiqAudioSourceStreamObjectImplCopyWith<$Res> {
  __$$DeeMusiqAudioSourceStreamObjectImplCopyWithImpl(
      _$DeeMusiqAudioSourceStreamObjectImpl _value,
      $Res Function(_$DeeMusiqAudioSourceStreamObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqAudioSourceStreamObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? container = null,
    Object? type = null,
    Object? codec = freezed,
    Object? bitrate = freezed,
    Object? bitDepth = freezed,
    Object? sampleRate = freezed,
  }) {
    return _then(_$DeeMusiqAudioSourceStreamObjectImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeeMusiqMediaCompressionType,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as double?,
      bitDepth: freezed == bitDepth
          ? _value.bitDepth
          : bitDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleRate: freezed == sampleRate
          ? _value.sampleRate
          : sampleRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqAudioSourceStreamObjectImpl
    implements _DeeMusiqAudioSourceStreamObject {
  _$DeeMusiqAudioSourceStreamObjectImpl(
      {required this.url,
      required this.container,
      required this.type,
      this.codec,
      this.bitrate,
      this.bitDepth,
      this.sampleRate});

  factory _$DeeMusiqAudioSourceStreamObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqAudioSourceStreamObjectImplFromJson(json);

  @override
  final String url;
  @override
  final String container;
  @override
  final DeeMusiqMediaCompressionType type;
  @override
  final String? codec;
  @override
  final double? bitrate;
  @override
  final int? bitDepth;
  @override
  final double? sampleRate;

  @override
  String toString() {
    return 'DeeMusiqAudioSourceStreamObject(url: $url, container: $container, type: $type, codec: $codec, bitrate: $bitrate, bitDepth: $bitDepth, sampleRate: $sampleRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqAudioSourceStreamObjectImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.bitDepth, bitDepth) ||
                other.bitDepth == bitDepth) &&
            (identical(other.sampleRate, sampleRate) ||
                other.sampleRate == sampleRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, container, type, codec, bitrate, bitDepth, sampleRate);

  /// Create a copy of DeeMusiqAudioSourceStreamObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqAudioSourceStreamObjectImplCopyWith<
          _$DeeMusiqAudioSourceStreamObjectImpl>
      get copyWith => __$$DeeMusiqAudioSourceStreamObjectImplCopyWithImpl<
          _$DeeMusiqAudioSourceStreamObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqAudioSourceStreamObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqAudioSourceStreamObject
    implements DeeMusiqAudioSourceStreamObject {
  factory _DeeMusiqAudioSourceStreamObject(
      {required final String url,
      required final String container,
      required final DeeMusiqMediaCompressionType type,
      final String? codec,
      final double? bitrate,
      final int? bitDepth,
      final double? sampleRate}) = _$DeeMusiqAudioSourceStreamObjectImpl;

  factory _DeeMusiqAudioSourceStreamObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqAudioSourceStreamObjectImpl.fromJson;

  @override
  String get url;
  @override
  String get container;
  @override
  DeeMusiqMediaCompressionType get type;
  @override
  String? get codec;
  @override
  double? get bitrate;
  @override
  int? get bitDepth;
  @override
  double? get sampleRate;

  /// Create a copy of DeeMusiqAudioSourceStreamObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqAudioSourceStreamObjectImplCopyWith<
          _$DeeMusiqAudioSourceStreamObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqFullAlbumObject _$DeeMusiqFullAlbumObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqFullAlbumObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqFullAlbumObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<DeeMusiqSimpleArtistObject> get artists =>
      throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  int get totalTracks => throw _privateConstructorUsedError;
  DeeMusiqAlbumType get albumType => throw _privateConstructorUsedError;
  String? get recordLabel => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqFullAlbumObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqFullAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqFullAlbumObjectCopyWith<DeeMusiqFullAlbumObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqFullAlbumObjectCopyWith<$Res> {
  factory $DeeMusiqFullAlbumObjectCopyWith(DeeMusiqFullAlbumObject value,
          $Res Function(DeeMusiqFullAlbumObject) then) =
      _$DeeMusiqFullAlbumObjectCopyWithImpl<$Res, DeeMusiqFullAlbumObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<DeeMusiqSimpleArtistObject> artists,
      List<DeeMusiqImageObject> images,
      String releaseDate,
      String externalUri,
      int totalTracks,
      DeeMusiqAlbumType albumType,
      String? recordLabel,
      List<String>? genres});
}

/// @nodoc
class _$DeeMusiqFullAlbumObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqFullAlbumObject>
    implements $DeeMusiqFullAlbumObjectCopyWith<$Res> {
  _$DeeMusiqFullAlbumObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqFullAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artists = null,
    Object? images = null,
    Object? releaseDate = null,
    Object? externalUri = null,
    Object? totalTracks = null,
    Object? albumType = null,
    Object? recordLabel = freezed,
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      totalTracks: null == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as DeeMusiqAlbumType,
      recordLabel: freezed == recordLabel
          ? _value.recordLabel
          : recordLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqFullAlbumObjectImplCopyWith<$Res>
    implements $DeeMusiqFullAlbumObjectCopyWith<$Res> {
  factory _$$DeeMusiqFullAlbumObjectImplCopyWith(
          _$DeeMusiqFullAlbumObjectImpl value,
          $Res Function(_$DeeMusiqFullAlbumObjectImpl) then) =
      __$$DeeMusiqFullAlbumObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<DeeMusiqSimpleArtistObject> artists,
      List<DeeMusiqImageObject> images,
      String releaseDate,
      String externalUri,
      int totalTracks,
      DeeMusiqAlbumType albumType,
      String? recordLabel,
      List<String>? genres});
}

/// @nodoc
class __$$DeeMusiqFullAlbumObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqFullAlbumObjectCopyWithImpl<$Res,
        _$DeeMusiqFullAlbumObjectImpl>
    implements _$$DeeMusiqFullAlbumObjectImplCopyWith<$Res> {
  __$$DeeMusiqFullAlbumObjectImplCopyWithImpl(
      _$DeeMusiqFullAlbumObjectImpl _value,
      $Res Function(_$DeeMusiqFullAlbumObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqFullAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artists = null,
    Object? images = null,
    Object? releaseDate = null,
    Object? externalUri = null,
    Object? totalTracks = null,
    Object? albumType = null,
    Object? recordLabel = freezed,
    Object? genres = freezed,
  }) {
    return _then(_$DeeMusiqFullAlbumObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      totalTracks: null == totalTracks
          ? _value.totalTracks
          : totalTracks // ignore: cast_nullable_to_non_nullable
              as int,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as DeeMusiqAlbumType,
      recordLabel: freezed == recordLabel
          ? _value.recordLabel
          : recordLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqFullAlbumObjectImpl implements _DeeMusiqFullAlbumObject {
  _$DeeMusiqFullAlbumObjectImpl(
      {required this.id,
      required this.name,
      required final List<DeeMusiqSimpleArtistObject> artists,
      final List<DeeMusiqImageObject> images = const [],
      required this.releaseDate,
      required this.externalUri,
      required this.totalTracks,
      required this.albumType,
      this.recordLabel,
      final List<String>? genres})
      : _artists = artists,
        _images = images,
        _genres = genres;

  factory _$DeeMusiqFullAlbumObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqFullAlbumObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<DeeMusiqSimpleArtistObject> _artists;
  @override
  List<DeeMusiqSimpleArtistObject> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String releaseDate;
  @override
  final String externalUri;
  @override
  final int totalTracks;
  @override
  final DeeMusiqAlbumType albumType;
  @override
  final String? recordLabel;
  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeeMusiqFullAlbumObject(id: $id, name: $name, artists: $artists, images: $images, releaseDate: $releaseDate, externalUri: $externalUri, totalTracks: $totalTracks, albumType: $albumType, recordLabel: $recordLabel, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqFullAlbumObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            (identical(other.totalTracks, totalTracks) ||
                other.totalTracks == totalTracks) &&
            (identical(other.albumType, albumType) ||
                other.albumType == albumType) &&
            (identical(other.recordLabel, recordLabel) ||
                other.recordLabel == recordLabel) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_images),
      releaseDate,
      externalUri,
      totalTracks,
      albumType,
      recordLabel,
      const DeepCollectionEquality().hash(_genres));

  /// Create a copy of DeeMusiqFullAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqFullAlbumObjectImplCopyWith<_$DeeMusiqFullAlbumObjectImpl>
      get copyWith => __$$DeeMusiqFullAlbumObjectImplCopyWithImpl<
          _$DeeMusiqFullAlbumObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqFullAlbumObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqFullAlbumObject implements DeeMusiqFullAlbumObject {
  factory _DeeMusiqFullAlbumObject(
      {required final String id,
      required final String name,
      required final List<DeeMusiqSimpleArtistObject> artists,
      final List<DeeMusiqImageObject> images,
      required final String releaseDate,
      required final String externalUri,
      required final int totalTracks,
      required final DeeMusiqAlbumType albumType,
      final String? recordLabel,
      final List<String>? genres}) = _$DeeMusiqFullAlbumObjectImpl;

  factory _DeeMusiqFullAlbumObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqFullAlbumObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<DeeMusiqSimpleArtistObject> get artists;
  @override
  List<DeeMusiqImageObject> get images;
  @override
  String get releaseDate;
  @override
  String get externalUri;
  @override
  int get totalTracks;
  @override
  DeeMusiqAlbumType get albumType;
  @override
  String? get recordLabel;
  @override
  List<String>? get genres;

  /// Create a copy of DeeMusiqFullAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqFullAlbumObjectImplCopyWith<_$DeeMusiqFullAlbumObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqSimpleAlbumObject _$DeeMusiqSimpleAlbumObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqSimpleAlbumObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqSimpleAlbumObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  List<DeeMusiqSimpleArtistObject> get artists =>
      throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;
  DeeMusiqAlbumType get albumType => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqSimpleAlbumObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqSimpleAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqSimpleAlbumObjectCopyWith<DeeMusiqSimpleAlbumObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqSimpleAlbumObjectCopyWith<$Res> {
  factory $DeeMusiqSimpleAlbumObjectCopyWith(DeeMusiqSimpleAlbumObject value,
          $Res Function(DeeMusiqSimpleAlbumObject) then) =
      _$DeeMusiqSimpleAlbumObjectCopyWithImpl<$Res, DeeMusiqSimpleAlbumObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqSimpleArtistObject> artists,
      List<DeeMusiqImageObject> images,
      DeeMusiqAlbumType albumType,
      String? releaseDate});
}

/// @nodoc
class _$DeeMusiqSimpleAlbumObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqSimpleAlbumObject>
    implements $DeeMusiqSimpleAlbumObjectCopyWith<$Res> {
  _$DeeMusiqSimpleAlbumObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqSimpleAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? artists = null,
    Object? images = null,
    Object? albumType = null,
    Object? releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as DeeMusiqAlbumType,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqSimpleAlbumObjectImplCopyWith<$Res>
    implements $DeeMusiqSimpleAlbumObjectCopyWith<$Res> {
  factory _$$DeeMusiqSimpleAlbumObjectImplCopyWith(
          _$DeeMusiqSimpleAlbumObjectImpl value,
          $Res Function(_$DeeMusiqSimpleAlbumObjectImpl) then) =
      __$$DeeMusiqSimpleAlbumObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqSimpleArtistObject> artists,
      List<DeeMusiqImageObject> images,
      DeeMusiqAlbumType albumType,
      String? releaseDate});
}

/// @nodoc
class __$$DeeMusiqSimpleAlbumObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqSimpleAlbumObjectCopyWithImpl<$Res,
        _$DeeMusiqSimpleAlbumObjectImpl>
    implements _$$DeeMusiqSimpleAlbumObjectImplCopyWith<$Res> {
  __$$DeeMusiqSimpleAlbumObjectImplCopyWithImpl(
      _$DeeMusiqSimpleAlbumObjectImpl _value,
      $Res Function(_$DeeMusiqSimpleAlbumObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqSimpleAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? artists = null,
    Object? images = null,
    Object? albumType = null,
    Object? releaseDate = freezed,
  }) {
    return _then(_$DeeMusiqSimpleAlbumObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      albumType: null == albumType
          ? _value.albumType
          : albumType // ignore: cast_nullable_to_non_nullable
              as DeeMusiqAlbumType,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqSimpleAlbumObjectImpl implements _DeeMusiqSimpleAlbumObject {
  _$DeeMusiqSimpleAlbumObjectImpl(
      {required this.id,
      required this.name,
      required this.externalUri,
      required final List<DeeMusiqSimpleArtistObject> artists,
      final List<DeeMusiqImageObject> images = const [],
      required this.albumType,
      this.releaseDate})
      : _artists = artists,
        _images = images;

  factory _$DeeMusiqSimpleAlbumObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqSimpleAlbumObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String externalUri;
  final List<DeeMusiqSimpleArtistObject> _artists;
  @override
  List<DeeMusiqSimpleArtistObject> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DeeMusiqAlbumType albumType;
  @override
  final String? releaseDate;

  @override
  String toString() {
    return 'DeeMusiqSimpleAlbumObject(id: $id, name: $name, externalUri: $externalUri, artists: $artists, images: $images, albumType: $albumType, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqSimpleAlbumObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.albumType, albumType) ||
                other.albumType == albumType) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      externalUri,
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_images),
      albumType,
      releaseDate);

  /// Create a copy of DeeMusiqSimpleAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqSimpleAlbumObjectImplCopyWith<_$DeeMusiqSimpleAlbumObjectImpl>
      get copyWith => __$$DeeMusiqSimpleAlbumObjectImplCopyWithImpl<
          _$DeeMusiqSimpleAlbumObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqSimpleAlbumObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqSimpleAlbumObject implements DeeMusiqSimpleAlbumObject {
  factory _DeeMusiqSimpleAlbumObject(
      {required final String id,
      required final String name,
      required final String externalUri,
      required final List<DeeMusiqSimpleArtistObject> artists,
      final List<DeeMusiqImageObject> images,
      required final DeeMusiqAlbumType albumType,
      final String? releaseDate}) = _$DeeMusiqSimpleAlbumObjectImpl;

  factory _DeeMusiqSimpleAlbumObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqSimpleAlbumObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get externalUri;
  @override
  List<DeeMusiqSimpleArtistObject> get artists;
  @override
  List<DeeMusiqImageObject> get images;
  @override
  DeeMusiqAlbumType get albumType;
  @override
  String? get releaseDate;

  /// Create a copy of DeeMusiqSimpleAlbumObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqSimpleAlbumObjectImplCopyWith<_$DeeMusiqSimpleAlbumObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqFullArtistObject _$DeeMusiqFullArtistObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqFullArtistObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqFullArtistObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  int? get followers => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqFullArtistObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqFullArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqFullArtistObjectCopyWith<DeeMusiqFullArtistObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqFullArtistObjectCopyWith<$Res> {
  factory $DeeMusiqFullArtistObjectCopyWith(DeeMusiqFullArtistObject value,
          $Res Function(DeeMusiqFullArtistObject) then) =
      _$DeeMusiqFullArtistObjectCopyWithImpl<$Res, DeeMusiqFullArtistObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqImageObject> images,
      List<String>? genres,
      int? followers});
}

/// @nodoc
class _$DeeMusiqFullArtistObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqFullArtistObject>
    implements $DeeMusiqFullArtistObjectCopyWith<$Res> {
  _$DeeMusiqFullArtistObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqFullArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? images = null,
    Object? genres = freezed,
    Object? followers = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqFullArtistObjectImplCopyWith<$Res>
    implements $DeeMusiqFullArtistObjectCopyWith<$Res> {
  factory _$$DeeMusiqFullArtistObjectImplCopyWith(
          _$DeeMusiqFullArtistObjectImpl value,
          $Res Function(_$DeeMusiqFullArtistObjectImpl) then) =
      __$$DeeMusiqFullArtistObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqImageObject> images,
      List<String>? genres,
      int? followers});
}

/// @nodoc
class __$$DeeMusiqFullArtistObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqFullArtistObjectCopyWithImpl<$Res,
        _$DeeMusiqFullArtistObjectImpl>
    implements _$$DeeMusiqFullArtistObjectImplCopyWith<$Res> {
  __$$DeeMusiqFullArtistObjectImplCopyWithImpl(
      _$DeeMusiqFullArtistObjectImpl _value,
      $Res Function(_$DeeMusiqFullArtistObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqFullArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? images = null,
    Object? genres = freezed,
    Object? followers = freezed,
  }) {
    return _then(_$DeeMusiqFullArtistObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqFullArtistObjectImpl implements _DeeMusiqFullArtistObject {
  _$DeeMusiqFullArtistObjectImpl(
      {required this.id,
      required this.name,
      required this.externalUri,
      final List<DeeMusiqImageObject> images = const [],
      final List<String>? genres,
      this.followers})
      : _images = images,
        _genres = genres;

  factory _$DeeMusiqFullArtistObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqFullArtistObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String externalUri;
  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? followers;

  @override
  String toString() {
    return 'DeeMusiqFullArtistObject(id: $id, name: $name, externalUri: $externalUri, images: $images, genres: $genres, followers: $followers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqFullArtistObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.followers, followers) ||
                other.followers == followers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      externalUri,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_genres),
      followers);

  /// Create a copy of DeeMusiqFullArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqFullArtistObjectImplCopyWith<_$DeeMusiqFullArtistObjectImpl>
      get copyWith => __$$DeeMusiqFullArtistObjectImplCopyWithImpl<
          _$DeeMusiqFullArtistObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqFullArtistObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqFullArtistObject implements DeeMusiqFullArtistObject {
  factory _DeeMusiqFullArtistObject(
      {required final String id,
      required final String name,
      required final String externalUri,
      final List<DeeMusiqImageObject> images,
      final List<String>? genres,
      final int? followers}) = _$DeeMusiqFullArtistObjectImpl;

  factory _DeeMusiqFullArtistObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqFullArtistObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get externalUri;
  @override
  List<DeeMusiqImageObject> get images;
  @override
  List<String>? get genres;
  @override
  int? get followers;

  /// Create a copy of DeeMusiqFullArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqFullArtistObjectImplCopyWith<_$DeeMusiqFullArtistObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqSimpleArtistObject _$DeeMusiqSimpleArtistObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqSimpleArtistObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqSimpleArtistObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  List<DeeMusiqImageObject>? get images => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqSimpleArtistObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqSimpleArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqSimpleArtistObjectCopyWith<DeeMusiqSimpleArtistObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqSimpleArtistObjectCopyWith<$Res> {
  factory $DeeMusiqSimpleArtistObjectCopyWith(DeeMusiqSimpleArtistObject value,
          $Res Function(DeeMusiqSimpleArtistObject) then) =
      _$DeeMusiqSimpleArtistObjectCopyWithImpl<$Res, DeeMusiqSimpleArtistObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqImageObject>? images});
}

/// @nodoc
class _$DeeMusiqSimpleArtistObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqSimpleArtistObject>
    implements $DeeMusiqSimpleArtistObjectCopyWith<$Res> {
  _$DeeMusiqSimpleArtistObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqSimpleArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqSimpleArtistObjectImplCopyWith<$Res>
    implements $DeeMusiqSimpleArtistObjectCopyWith<$Res> {
  factory _$$DeeMusiqSimpleArtistObjectImplCopyWith(
          _$DeeMusiqSimpleArtistObjectImpl value,
          $Res Function(_$DeeMusiqSimpleArtistObjectImpl) then) =
      __$$DeeMusiqSimpleArtistObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqImageObject>? images});
}

/// @nodoc
class __$$DeeMusiqSimpleArtistObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqSimpleArtistObjectCopyWithImpl<$Res,
        _$DeeMusiqSimpleArtistObjectImpl>
    implements _$$DeeMusiqSimpleArtistObjectImplCopyWith<$Res> {
  __$$DeeMusiqSimpleArtistObjectImplCopyWithImpl(
      _$DeeMusiqSimpleArtistObjectImpl _value,
      $Res Function(_$DeeMusiqSimpleArtistObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqSimpleArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? images = freezed,
  }) {
    return _then(_$DeeMusiqSimpleArtistObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqSimpleArtistObjectImpl implements _DeeMusiqSimpleArtistObject {
  _$DeeMusiqSimpleArtistObjectImpl(
      {required this.id,
      required this.name,
      required this.externalUri,
      final List<DeeMusiqImageObject>? images})
      : _images = images;

  factory _$DeeMusiqSimpleArtistObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqSimpleArtistObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String externalUri;
  final List<DeeMusiqImageObject>? _images;
  @override
  List<DeeMusiqImageObject>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeeMusiqSimpleArtistObject(id: $id, name: $name, externalUri: $externalUri, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqSimpleArtistObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, externalUri,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of DeeMusiqSimpleArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqSimpleArtistObjectImplCopyWith<_$DeeMusiqSimpleArtistObjectImpl>
      get copyWith => __$$DeeMusiqSimpleArtistObjectImplCopyWithImpl<
          _$DeeMusiqSimpleArtistObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqSimpleArtistObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqSimpleArtistObject implements DeeMusiqSimpleArtistObject {
  factory _DeeMusiqSimpleArtistObject(
          {required final String id,
          required final String name,
          required final String externalUri,
          final List<DeeMusiqImageObject>? images}) =
      _$DeeMusiqSimpleArtistObjectImpl;

  factory _DeeMusiqSimpleArtistObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqSimpleArtistObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get externalUri;
  @override
  List<DeeMusiqImageObject>? get images;

  /// Create a copy of DeeMusiqSimpleArtistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqSimpleArtistObjectImplCopyWith<_$DeeMusiqSimpleArtistObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqBrowseSectionObject<T> _$DeeMusiqBrowseSectionObjectFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DeeMusiqBrowseSectionObject<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DeeMusiqBrowseSectionObject<T> {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  bool get browseMore => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqBrowseSectionObject to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqBrowseSectionObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqBrowseSectionObjectCopyWith<T, DeeMusiqBrowseSectionObject<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqBrowseSectionObjectCopyWith<T, $Res> {
  factory $DeeMusiqBrowseSectionObjectCopyWith(
          DeeMusiqBrowseSectionObject<T> value,
          $Res Function(DeeMusiqBrowseSectionObject<T>) then) =
      _$DeeMusiqBrowseSectionObjectCopyWithImpl<T, $Res,
          DeeMusiqBrowseSectionObject<T>>;
  @useResult
  $Res call(
      {String id,
      String title,
      String externalUri,
      bool browseMore,
      List<T> items});
}

/// @nodoc
class _$DeeMusiqBrowseSectionObjectCopyWithImpl<T, $Res,
        $Val extends DeeMusiqBrowseSectionObject<T>>
    implements $DeeMusiqBrowseSectionObjectCopyWith<T, $Res> {
  _$DeeMusiqBrowseSectionObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqBrowseSectionObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? externalUri = null,
    Object? browseMore = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      browseMore: null == browseMore
          ? _value.browseMore
          : browseMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqBrowseSectionObjectImplCopyWith<T, $Res>
    implements $DeeMusiqBrowseSectionObjectCopyWith<T, $Res> {
  factory _$$DeeMusiqBrowseSectionObjectImplCopyWith(
          _$DeeMusiqBrowseSectionObjectImpl<T> value,
          $Res Function(_$DeeMusiqBrowseSectionObjectImpl<T>) then) =
      __$$DeeMusiqBrowseSectionObjectImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String externalUri,
      bool browseMore,
      List<T> items});
}

/// @nodoc
class __$$DeeMusiqBrowseSectionObjectImplCopyWithImpl<T, $Res>
    extends _$DeeMusiqBrowseSectionObjectCopyWithImpl<T, $Res,
        _$DeeMusiqBrowseSectionObjectImpl<T>>
    implements _$$DeeMusiqBrowseSectionObjectImplCopyWith<T, $Res> {
  __$$DeeMusiqBrowseSectionObjectImplCopyWithImpl(
      _$DeeMusiqBrowseSectionObjectImpl<T> _value,
      $Res Function(_$DeeMusiqBrowseSectionObjectImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqBrowseSectionObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? externalUri = null,
    Object? browseMore = null,
    Object? items = null,
  }) {
    return _then(_$DeeMusiqBrowseSectionObjectImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      browseMore: null == browseMore
          ? _value.browseMore
          : browseMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DeeMusiqBrowseSectionObjectImpl<T>
    implements _DeeMusiqBrowseSectionObject<T> {
  _$DeeMusiqBrowseSectionObjectImpl(
      {required this.id,
      required this.title,
      required this.externalUri,
      required this.browseMore,
      required final List<T> items})
      : _items = items;

  factory _$DeeMusiqBrowseSectionObjectImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DeeMusiqBrowseSectionObjectImplFromJson(json, fromJsonT);

  @override
  final String id;
  @override
  final String title;
  @override
  final String externalUri;
  @override
  final bool browseMore;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DeeMusiqBrowseSectionObject<$T>(id: $id, title: $title, externalUri: $externalUri, browseMore: $browseMore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqBrowseSectionObjectImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            (identical(other.browseMore, browseMore) ||
                other.browseMore == browseMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, externalUri,
      browseMore, const DeepCollectionEquality().hash(_items));

  /// Create a copy of DeeMusiqBrowseSectionObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqBrowseSectionObjectImplCopyWith<T,
          _$DeeMusiqBrowseSectionObjectImpl<T>>
      get copyWith => __$$DeeMusiqBrowseSectionObjectImplCopyWithImpl<T,
          _$DeeMusiqBrowseSectionObjectImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DeeMusiqBrowseSectionObjectImplToJson<T>(this, toJsonT);
  }
}

abstract class _DeeMusiqBrowseSectionObject<T>
    implements DeeMusiqBrowseSectionObject<T> {
  factory _DeeMusiqBrowseSectionObject(
      {required final String id,
      required final String title,
      required final String externalUri,
      required final bool browseMore,
      required final List<T> items}) = _$DeeMusiqBrowseSectionObjectImpl<T>;

  factory _DeeMusiqBrowseSectionObject.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DeeMusiqBrowseSectionObjectImpl<T>.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get externalUri;
  @override
  bool get browseMore;
  @override
  List<T> get items;

  /// Create a copy of DeeMusiqBrowseSectionObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqBrowseSectionObjectImplCopyWith<T,
          _$DeeMusiqBrowseSectionObjectImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

MetadataFormFieldObject _$MetadataFormFieldObjectFromJson(
    Map<String, dynamic> json) {
  switch (json['objectType']) {
    case 'input':
      return MetadataFormFieldInputObject.fromJson(json);
    case 'text':
      return MetadataFormFieldTextObject.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'objectType',
          'MetadataFormFieldObject',
          'Invalid union type "${json['objectType']}"!');
  }
}

/// @nodoc
mixin _$MetadataFormFieldObject {
  String get objectType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)
        input,
    required TResult Function(String objectType, String text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult? Function(String objectType, String text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult Function(String objectType, String text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MetadataFormFieldInputObject value) input,
    required TResult Function(MetadataFormFieldTextObject value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MetadataFormFieldInputObject value)? input,
    TResult? Function(MetadataFormFieldTextObject value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MetadataFormFieldInputObject value)? input,
    TResult Function(MetadataFormFieldTextObject value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MetadataFormFieldObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetadataFormFieldObjectCopyWith<MetadataFormFieldObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataFormFieldObjectCopyWith<$Res> {
  factory $MetadataFormFieldObjectCopyWith(MetadataFormFieldObject value,
          $Res Function(MetadataFormFieldObject) then) =
      _$MetadataFormFieldObjectCopyWithImpl<$Res, MetadataFormFieldObject>;
  @useResult
  $Res call({String objectType});
}

/// @nodoc
class _$MetadataFormFieldObjectCopyWithImpl<$Res,
        $Val extends MetadataFormFieldObject>
    implements $MetadataFormFieldObjectCopyWith<$Res> {
  _$MetadataFormFieldObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectType = null,
  }) {
    return _then(_value.copyWith(
      objectType: null == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataFormFieldInputObjectImplCopyWith<$Res>
    implements $MetadataFormFieldObjectCopyWith<$Res> {
  factory _$$MetadataFormFieldInputObjectImplCopyWith(
          _$MetadataFormFieldInputObjectImpl value,
          $Res Function(_$MetadataFormFieldInputObjectImpl) then) =
      __$$MetadataFormFieldInputObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectType,
      String id,
      FormFieldVariant variant,
      String? placeholder,
      String? defaultValue,
      bool? required,
      String? regex});
}

/// @nodoc
class __$$MetadataFormFieldInputObjectImplCopyWithImpl<$Res>
    extends _$MetadataFormFieldObjectCopyWithImpl<$Res,
        _$MetadataFormFieldInputObjectImpl>
    implements _$$MetadataFormFieldInputObjectImplCopyWith<$Res> {
  __$$MetadataFormFieldInputObjectImplCopyWithImpl(
      _$MetadataFormFieldInputObjectImpl _value,
      $Res Function(_$MetadataFormFieldInputObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectType = null,
    Object? id = null,
    Object? variant = null,
    Object? placeholder = freezed,
    Object? defaultValue = freezed,
    Object? required = freezed,
    Object? regex = freezed,
  }) {
    return _then(_$MetadataFormFieldInputObjectImpl(
      objectType: null == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as FormFieldVariant,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultValue: freezed == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      regex: freezed == regex
          ? _value.regex
          : regex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataFormFieldInputObjectImpl
    implements MetadataFormFieldInputObject {
  _$MetadataFormFieldInputObjectImpl(
      {required this.objectType,
      required this.id,
      this.variant = FormFieldVariant.text,
      this.placeholder,
      this.defaultValue,
      this.required,
      this.regex});

  factory _$MetadataFormFieldInputObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MetadataFormFieldInputObjectImplFromJson(json);

  @override
  final String objectType;
  @override
  final String id;
  @override
  @JsonKey()
  final FormFieldVariant variant;
  @override
  final String? placeholder;
  @override
  final String? defaultValue;
  @override
  final bool? required;
  @override
  final String? regex;

  @override
  String toString() {
    return 'MetadataFormFieldObject.input(objectType: $objectType, id: $id, variant: $variant, placeholder: $placeholder, defaultValue: $defaultValue, required: $required, regex: $regex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataFormFieldInputObjectImpl &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.regex, regex) || other.regex == regex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, objectType, id, variant,
      placeholder, defaultValue, required, regex);

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataFormFieldInputObjectImplCopyWith<
          _$MetadataFormFieldInputObjectImpl>
      get copyWith => __$$MetadataFormFieldInputObjectImplCopyWithImpl<
          _$MetadataFormFieldInputObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)
        input,
    required TResult Function(String objectType, String text) text,
  }) {
    return input(
        objectType, id, variant, placeholder, defaultValue, required, regex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult? Function(String objectType, String text)? text,
  }) {
    return input?.call(
        objectType, id, variant, placeholder, defaultValue, required, regex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult Function(String objectType, String text)? text,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(
          objectType, id, variant, placeholder, defaultValue, required, regex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MetadataFormFieldInputObject value) input,
    required TResult Function(MetadataFormFieldTextObject value) text,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MetadataFormFieldInputObject value)? input,
    TResult? Function(MetadataFormFieldTextObject value)? text,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MetadataFormFieldInputObject value)? input,
    TResult Function(MetadataFormFieldTextObject value)? text,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataFormFieldInputObjectImplToJson(
      this,
    );
  }
}

abstract class MetadataFormFieldInputObject implements MetadataFormFieldObject {
  factory MetadataFormFieldInputObject(
      {required final String objectType,
      required final String id,
      final FormFieldVariant variant,
      final String? placeholder,
      final String? defaultValue,
      final bool? required,
      final String? regex}) = _$MetadataFormFieldInputObjectImpl;

  factory MetadataFormFieldInputObject.fromJson(Map<String, dynamic> json) =
      _$MetadataFormFieldInputObjectImpl.fromJson;

  @override
  String get objectType;
  String get id;
  FormFieldVariant get variant;
  String? get placeholder;
  String? get defaultValue;
  bool? get required;
  String? get regex;

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataFormFieldInputObjectImplCopyWith<
          _$MetadataFormFieldInputObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MetadataFormFieldTextObjectImplCopyWith<$Res>
    implements $MetadataFormFieldObjectCopyWith<$Res> {
  factory _$$MetadataFormFieldTextObjectImplCopyWith(
          _$MetadataFormFieldTextObjectImpl value,
          $Res Function(_$MetadataFormFieldTextObjectImpl) then) =
      __$$MetadataFormFieldTextObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String objectType, String text});
}

/// @nodoc
class __$$MetadataFormFieldTextObjectImplCopyWithImpl<$Res>
    extends _$MetadataFormFieldObjectCopyWithImpl<$Res,
        _$MetadataFormFieldTextObjectImpl>
    implements _$$MetadataFormFieldTextObjectImplCopyWith<$Res> {
  __$$MetadataFormFieldTextObjectImplCopyWithImpl(
      _$MetadataFormFieldTextObjectImpl _value,
      $Res Function(_$MetadataFormFieldTextObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectType = null,
    Object? text = null,
  }) {
    return _then(_$MetadataFormFieldTextObjectImpl(
      objectType: null == objectType
          ? _value.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataFormFieldTextObjectImpl implements MetadataFormFieldTextObject {
  _$MetadataFormFieldTextObjectImpl(
      {required this.objectType, required this.text});

  factory _$MetadataFormFieldTextObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MetadataFormFieldTextObjectImplFromJson(json);

  @override
  final String objectType;
  @override
  final String text;

  @override
  String toString() {
    return 'MetadataFormFieldObject.text(objectType: $objectType, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataFormFieldTextObjectImpl &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, objectType, text);

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataFormFieldTextObjectImplCopyWith<_$MetadataFormFieldTextObjectImpl>
      get copyWith => __$$MetadataFormFieldTextObjectImplCopyWithImpl<
          _$MetadataFormFieldTextObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)
        input,
    required TResult Function(String objectType, String text) text,
  }) {
    return text(objectType, this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult? Function(String objectType, String text)? text,
  }) {
    return text?.call(objectType, this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String objectType,
            String id,
            FormFieldVariant variant,
            String? placeholder,
            String? defaultValue,
            bool? required,
            String? regex)?
        input,
    TResult Function(String objectType, String text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(objectType, this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MetadataFormFieldInputObject value) input,
    required TResult Function(MetadataFormFieldTextObject value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MetadataFormFieldInputObject value)? input,
    TResult? Function(MetadataFormFieldTextObject value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MetadataFormFieldInputObject value)? input,
    TResult Function(MetadataFormFieldTextObject value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataFormFieldTextObjectImplToJson(
      this,
    );
  }
}

abstract class MetadataFormFieldTextObject implements MetadataFormFieldObject {
  factory MetadataFormFieldTextObject(
      {required final String objectType,
      required final String text}) = _$MetadataFormFieldTextObjectImpl;

  factory MetadataFormFieldTextObject.fromJson(Map<String, dynamic> json) =
      _$MetadataFormFieldTextObjectImpl.fromJson;

  @override
  String get objectType;
  String get text;

  /// Create a copy of MetadataFormFieldObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataFormFieldTextObjectImplCopyWith<_$MetadataFormFieldTextObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqImageObject _$DeeMusiqImageObjectFromJson(Map<String, dynamic> json) {
  return _DeeMusiqImageObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqImageObject {
  String get url => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqImageObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqImageObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqImageObjectCopyWith<DeeMusiqImageObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqImageObjectCopyWith<$Res> {
  factory $DeeMusiqImageObjectCopyWith(
          DeeMusiqImageObject value, $Res Function(DeeMusiqImageObject) then) =
      _$DeeMusiqImageObjectCopyWithImpl<$Res, DeeMusiqImageObject>;
  @useResult
  $Res call({String url, int? width, int? height});
}

/// @nodoc
class _$DeeMusiqImageObjectCopyWithImpl<$Res, $Val extends DeeMusiqImageObject>
    implements $DeeMusiqImageObjectCopyWith<$Res> {
  _$DeeMusiqImageObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqImageObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqImageObjectImplCopyWith<$Res>
    implements $DeeMusiqImageObjectCopyWith<$Res> {
  factory _$$DeeMusiqImageObjectImplCopyWith(_$DeeMusiqImageObjectImpl value,
          $Res Function(_$DeeMusiqImageObjectImpl) then) =
      __$$DeeMusiqImageObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, int? width, int? height});
}

/// @nodoc
class __$$DeeMusiqImageObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqImageObjectCopyWithImpl<$Res, _$DeeMusiqImageObjectImpl>
    implements _$$DeeMusiqImageObjectImplCopyWith<$Res> {
  __$$DeeMusiqImageObjectImplCopyWithImpl(_$DeeMusiqImageObjectImpl _value,
      $Res Function(_$DeeMusiqImageObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqImageObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$DeeMusiqImageObjectImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqImageObjectImpl implements _DeeMusiqImageObject {
  _$DeeMusiqImageObjectImpl({required this.url, this.width, this.height});

  factory _$DeeMusiqImageObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqImageObjectImplFromJson(json);

  @override
  final String url;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'DeeMusiqImageObject(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqImageObjectImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  /// Create a copy of DeeMusiqImageObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqImageObjectImplCopyWith<_$DeeMusiqImageObjectImpl> get copyWith =>
      __$$DeeMusiqImageObjectImplCopyWithImpl<_$DeeMusiqImageObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqImageObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqImageObject implements DeeMusiqImageObject {
  factory _DeeMusiqImageObject(
      {required final String url,
      final int? width,
      final int? height}) = _$DeeMusiqImageObjectImpl;

  factory _DeeMusiqImageObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqImageObjectImpl.fromJson;

  @override
  String get url;
  @override
  int? get width;
  @override
  int? get height;

  /// Create a copy of DeeMusiqImageObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqImageObjectImplCopyWith<_$DeeMusiqImageObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeeMusiqPaginationResponseObject<T> _$DeeMusiqPaginationResponseObjectFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DeeMusiqPaginationResponseObject<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DeeMusiqPaginationResponseObject<T> {
  int get limit => throw _privateConstructorUsedError;
  int? get nextOffset => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqPaginationResponseObject to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqPaginationResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqPaginationResponseObjectCopyWith<T,
          DeeMusiqPaginationResponseObject<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqPaginationResponseObjectCopyWith<T, $Res> {
  factory $DeeMusiqPaginationResponseObjectCopyWith(
          DeeMusiqPaginationResponseObject<T> value,
          $Res Function(DeeMusiqPaginationResponseObject<T>) then) =
      _$DeeMusiqPaginationResponseObjectCopyWithImpl<T, $Res,
          DeeMusiqPaginationResponseObject<T>>;
  @useResult
  $Res call(
      {int limit, int? nextOffset, int total, bool hasMore, List<T> items});
}

/// @nodoc
class _$DeeMusiqPaginationResponseObjectCopyWithImpl<T, $Res,
        $Val extends DeeMusiqPaginationResponseObject<T>>
    implements $DeeMusiqPaginationResponseObjectCopyWith<T, $Res> {
  _$DeeMusiqPaginationResponseObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqPaginationResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? nextOffset = freezed,
    Object? total = null,
    Object? hasMore = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      nextOffset: freezed == nextOffset
          ? _value.nextOffset
          : nextOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqPaginationResponseObjectImplCopyWith<T, $Res>
    implements $DeeMusiqPaginationResponseObjectCopyWith<T, $Res> {
  factory _$$DeeMusiqPaginationResponseObjectImplCopyWith(
          _$DeeMusiqPaginationResponseObjectImpl<T> value,
          $Res Function(_$DeeMusiqPaginationResponseObjectImpl<T>) then) =
      __$$DeeMusiqPaginationResponseObjectImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int limit, int? nextOffset, int total, bool hasMore, List<T> items});
}

/// @nodoc
class __$$DeeMusiqPaginationResponseObjectImplCopyWithImpl<T, $Res>
    extends _$DeeMusiqPaginationResponseObjectCopyWithImpl<T, $Res,
        _$DeeMusiqPaginationResponseObjectImpl<T>>
    implements _$$DeeMusiqPaginationResponseObjectImplCopyWith<T, $Res> {
  __$$DeeMusiqPaginationResponseObjectImplCopyWithImpl(
      _$DeeMusiqPaginationResponseObjectImpl<T> _value,
      $Res Function(_$DeeMusiqPaginationResponseObjectImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqPaginationResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? nextOffset = freezed,
    Object? total = null,
    Object? hasMore = null,
    Object? items = null,
  }) {
    return _then(_$DeeMusiqPaginationResponseObjectImpl<T>(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      nextOffset: freezed == nextOffset
          ? _value.nextOffset
          : nextOffset // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DeeMusiqPaginationResponseObjectImpl<T>
    implements _DeeMusiqPaginationResponseObject<T> {
  _$DeeMusiqPaginationResponseObjectImpl(
      {required this.limit,
      required this.nextOffset,
      required this.total,
      required this.hasMore,
      required final List<T> items})
      : _items = items;

  factory _$DeeMusiqPaginationResponseObjectImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DeeMusiqPaginationResponseObjectImplFromJson(json, fromJsonT);

  @override
  final int limit;
  @override
  final int? nextOffset;
  @override
  final int total;
  @override
  final bool hasMore;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DeeMusiqPaginationResponseObject<$T>(limit: $limit, nextOffset: $nextOffset, total: $total, hasMore: $hasMore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqPaginationResponseObjectImpl<T> &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, nextOffset, total,
      hasMore, const DeepCollectionEquality().hash(_items));

  /// Create a copy of DeeMusiqPaginationResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqPaginationResponseObjectImplCopyWith<T,
          _$DeeMusiqPaginationResponseObjectImpl<T>>
      get copyWith => __$$DeeMusiqPaginationResponseObjectImplCopyWithImpl<T,
          _$DeeMusiqPaginationResponseObjectImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DeeMusiqPaginationResponseObjectImplToJson<T>(this, toJsonT);
  }
}

abstract class _DeeMusiqPaginationResponseObject<T>
    implements DeeMusiqPaginationResponseObject<T> {
  factory _DeeMusiqPaginationResponseObject(
      {required final int limit,
      required final int? nextOffset,
      required final int total,
      required final bool hasMore,
      required final List<T> items}) = _$DeeMusiqPaginationResponseObjectImpl<T>;

  factory _DeeMusiqPaginationResponseObject.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DeeMusiqPaginationResponseObjectImpl<T>.fromJson;

  @override
  int get limit;
  @override
  int? get nextOffset;
  @override
  int get total;
  @override
  bool get hasMore;
  @override
  List<T> get items;

  /// Create a copy of DeeMusiqPaginationResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqPaginationResponseObjectImplCopyWith<T,
          _$DeeMusiqPaginationResponseObjectImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqFullPlaylistObject _$DeeMusiqFullPlaylistObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqFullPlaylistObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqFullPlaylistObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  DeeMusiqUserObject get owner => throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;
  List<DeeMusiqUserObject> get collaborators =>
      throw _privateConstructorUsedError;
  bool get collaborative => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqFullPlaylistObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqFullPlaylistObjectCopyWith<DeeMusiqFullPlaylistObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqFullPlaylistObjectCopyWith<$Res> {
  factory $DeeMusiqFullPlaylistObjectCopyWith(DeeMusiqFullPlaylistObject value,
          $Res Function(DeeMusiqFullPlaylistObject) then) =
      _$DeeMusiqFullPlaylistObjectCopyWithImpl<$Res, DeeMusiqFullPlaylistObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String externalUri,
      DeeMusiqUserObject owner,
      List<DeeMusiqImageObject> images,
      List<DeeMusiqUserObject> collaborators,
      bool collaborative,
      bool public});

  $DeeMusiqUserObjectCopyWith<$Res> get owner;
}

/// @nodoc
class _$DeeMusiqFullPlaylistObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqFullPlaylistObject>
    implements $DeeMusiqFullPlaylistObjectCopyWith<$Res> {
  _$DeeMusiqFullPlaylistObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? externalUri = null,
    Object? owner = null,
    Object? images = null,
    Object? collaborators = null,
    Object? collaborative = null,
    Object? public = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DeeMusiqUserObject,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      collaborators: null == collaborators
          ? _value.collaborators
          : collaborators // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqUserObject>,
      collaborative: null == collaborative
          ? _value.collaborative
          : collaborative // ignore: cast_nullable_to_non_nullable
              as bool,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeeMusiqUserObjectCopyWith<$Res> get owner {
    return $DeeMusiqUserObjectCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeMusiqFullPlaylistObjectImplCopyWith<$Res>
    implements $DeeMusiqFullPlaylistObjectCopyWith<$Res> {
  factory _$$DeeMusiqFullPlaylistObjectImplCopyWith(
          _$DeeMusiqFullPlaylistObjectImpl value,
          $Res Function(_$DeeMusiqFullPlaylistObjectImpl) then) =
      __$$DeeMusiqFullPlaylistObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String externalUri,
      DeeMusiqUserObject owner,
      List<DeeMusiqImageObject> images,
      List<DeeMusiqUserObject> collaborators,
      bool collaborative,
      bool public});

  @override
  $DeeMusiqUserObjectCopyWith<$Res> get owner;
}

/// @nodoc
class __$$DeeMusiqFullPlaylistObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqFullPlaylistObjectCopyWithImpl<$Res,
        _$DeeMusiqFullPlaylistObjectImpl>
    implements _$$DeeMusiqFullPlaylistObjectImplCopyWith<$Res> {
  __$$DeeMusiqFullPlaylistObjectImplCopyWithImpl(
      _$DeeMusiqFullPlaylistObjectImpl _value,
      $Res Function(_$DeeMusiqFullPlaylistObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? externalUri = null,
    Object? owner = null,
    Object? images = null,
    Object? collaborators = null,
    Object? collaborative = null,
    Object? public = null,
  }) {
    return _then(_$DeeMusiqFullPlaylistObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DeeMusiqUserObject,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      collaborators: null == collaborators
          ? _value._collaborators
          : collaborators // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqUserObject>,
      collaborative: null == collaborative
          ? _value.collaborative
          : collaborative // ignore: cast_nullable_to_non_nullable
              as bool,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqFullPlaylistObjectImpl implements _DeeMusiqFullPlaylistObject {
  _$DeeMusiqFullPlaylistObjectImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.externalUri,
      required this.owner,
      final List<DeeMusiqImageObject> images = const [],
      final List<DeeMusiqUserObject> collaborators = const [],
      this.collaborative = false,
      this.public = false})
      : _images = images,
        _collaborators = collaborators;

  factory _$DeeMusiqFullPlaylistObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqFullPlaylistObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String externalUri;
  @override
  final DeeMusiqUserObject owner;
  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<DeeMusiqUserObject> _collaborators;
  @override
  @JsonKey()
  List<DeeMusiqUserObject> get collaborators {
    if (_collaborators is EqualUnmodifiableListView) return _collaborators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collaborators);
  }

  @override
  @JsonKey()
  final bool collaborative;
  @override
  @JsonKey()
  final bool public;

  @override
  String toString() {
    return 'DeeMusiqFullPlaylistObject(id: $id, name: $name, description: $description, externalUri: $externalUri, owner: $owner, images: $images, collaborators: $collaborators, collaborative: $collaborative, public: $public)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqFullPlaylistObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._collaborators, _collaborators) &&
            (identical(other.collaborative, collaborative) ||
                other.collaborative == collaborative) &&
            (identical(other.public, public) || other.public == public));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      externalUri,
      owner,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_collaborators),
      collaborative,
      public);

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqFullPlaylistObjectImplCopyWith<_$DeeMusiqFullPlaylistObjectImpl>
      get copyWith => __$$DeeMusiqFullPlaylistObjectImplCopyWithImpl<
          _$DeeMusiqFullPlaylistObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqFullPlaylistObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqFullPlaylistObject implements DeeMusiqFullPlaylistObject {
  factory _DeeMusiqFullPlaylistObject(
      {required final String id,
      required final String name,
      required final String description,
      required final String externalUri,
      required final DeeMusiqUserObject owner,
      final List<DeeMusiqImageObject> images,
      final List<DeeMusiqUserObject> collaborators,
      final bool collaborative,
      final bool public}) = _$DeeMusiqFullPlaylistObjectImpl;

  factory _DeeMusiqFullPlaylistObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqFullPlaylistObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get externalUri;
  @override
  DeeMusiqUserObject get owner;
  @override
  List<DeeMusiqImageObject> get images;
  @override
  List<DeeMusiqUserObject> get collaborators;
  @override
  bool get collaborative;
  @override
  bool get public;

  /// Create a copy of DeeMusiqFullPlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqFullPlaylistObjectImplCopyWith<_$DeeMusiqFullPlaylistObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqSimplePlaylistObject _$DeeMusiqSimplePlaylistObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqSimplePlaylistObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqSimplePlaylistObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  DeeMusiqUserObject get owner => throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqSimplePlaylistObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqSimplePlaylistObjectCopyWith<DeeMusiqSimplePlaylistObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqSimplePlaylistObjectCopyWith<$Res> {
  factory $DeeMusiqSimplePlaylistObjectCopyWith(
          DeeMusiqSimplePlaylistObject value,
          $Res Function(DeeMusiqSimplePlaylistObject) then) =
      _$DeeMusiqSimplePlaylistObjectCopyWithImpl<$Res,
          DeeMusiqSimplePlaylistObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String externalUri,
      DeeMusiqUserObject owner,
      List<DeeMusiqImageObject> images});

  $DeeMusiqUserObjectCopyWith<$Res> get owner;
}

/// @nodoc
class _$DeeMusiqSimplePlaylistObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqSimplePlaylistObject>
    implements $DeeMusiqSimplePlaylistObjectCopyWith<$Res> {
  _$DeeMusiqSimplePlaylistObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? externalUri = null,
    Object? owner = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DeeMusiqUserObject,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
    ) as $Val);
  }

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeeMusiqUserObjectCopyWith<$Res> get owner {
    return $DeeMusiqUserObjectCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeMusiqSimplePlaylistObjectImplCopyWith<$Res>
    implements $DeeMusiqSimplePlaylistObjectCopyWith<$Res> {
  factory _$$DeeMusiqSimplePlaylistObjectImplCopyWith(
          _$DeeMusiqSimplePlaylistObjectImpl value,
          $Res Function(_$DeeMusiqSimplePlaylistObjectImpl) then) =
      __$$DeeMusiqSimplePlaylistObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String externalUri,
      DeeMusiqUserObject owner,
      List<DeeMusiqImageObject> images});

  @override
  $DeeMusiqUserObjectCopyWith<$Res> get owner;
}

/// @nodoc
class __$$DeeMusiqSimplePlaylistObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqSimplePlaylistObjectCopyWithImpl<$Res,
        _$DeeMusiqSimplePlaylistObjectImpl>
    implements _$$DeeMusiqSimplePlaylistObjectImplCopyWith<$Res> {
  __$$DeeMusiqSimplePlaylistObjectImplCopyWithImpl(
      _$DeeMusiqSimplePlaylistObjectImpl _value,
      $Res Function(_$DeeMusiqSimplePlaylistObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? externalUri = null,
    Object? owner = null,
    Object? images = null,
  }) {
    return _then(_$DeeMusiqSimplePlaylistObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as DeeMusiqUserObject,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqSimplePlaylistObjectImpl
    implements _DeeMusiqSimplePlaylistObject {
  _$DeeMusiqSimplePlaylistObjectImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.externalUri,
      required this.owner,
      final List<DeeMusiqImageObject> images = const []})
      : _images = images;

  factory _$DeeMusiqSimplePlaylistObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqSimplePlaylistObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String externalUri;
  @override
  final DeeMusiqUserObject owner;
  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'DeeMusiqSimplePlaylistObject(id: $id, name: $name, description: $description, externalUri: $externalUri, owner: $owner, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqSimplePlaylistObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      externalUri, owner, const DeepCollectionEquality().hash(_images));

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqSimplePlaylistObjectImplCopyWith<_$DeeMusiqSimplePlaylistObjectImpl>
      get copyWith => __$$DeeMusiqSimplePlaylistObjectImplCopyWithImpl<
          _$DeeMusiqSimplePlaylistObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqSimplePlaylistObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqSimplePlaylistObject
    implements DeeMusiqSimplePlaylistObject {
  factory _DeeMusiqSimplePlaylistObject(
          {required final String id,
          required final String name,
          required final String description,
          required final String externalUri,
          required final DeeMusiqUserObject owner,
          final List<DeeMusiqImageObject> images}) =
      _$DeeMusiqSimplePlaylistObjectImpl;

  factory _DeeMusiqSimplePlaylistObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqSimplePlaylistObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get externalUri;
  @override
  DeeMusiqUserObject get owner;
  @override
  List<DeeMusiqImageObject> get images;

  /// Create a copy of DeeMusiqSimplePlaylistObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqSimplePlaylistObjectImplCopyWith<_$DeeMusiqSimplePlaylistObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqSearchResponseObject _$DeeMusiqSearchResponseObjectFromJson(
    Map<String, dynamic> json) {
  return _DeeMusiqSearchResponseObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqSearchResponseObject {
  List<DeeMusiqSimpleAlbumObject> get albums =>
      throw _privateConstructorUsedError;
  List<DeeMusiqFullArtistObject> get artists =>
      throw _privateConstructorUsedError;
  List<DeeMusiqSimplePlaylistObject> get playlists =>
      throw _privateConstructorUsedError;
  List<DeeMusiqFullTrackObject> get tracks => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqSearchResponseObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqSearchResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqSearchResponseObjectCopyWith<DeeMusiqSearchResponseObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqSearchResponseObjectCopyWith<$Res> {
  factory $DeeMusiqSearchResponseObjectCopyWith(
          DeeMusiqSearchResponseObject value,
          $Res Function(DeeMusiqSearchResponseObject) then) =
      _$DeeMusiqSearchResponseObjectCopyWithImpl<$Res,
          DeeMusiqSearchResponseObject>;
  @useResult
  $Res call(
      {List<DeeMusiqSimpleAlbumObject> albums,
      List<DeeMusiqFullArtistObject> artists,
      List<DeeMusiqSimplePlaylistObject> playlists,
      List<DeeMusiqFullTrackObject> tracks});
}

/// @nodoc
class _$DeeMusiqSearchResponseObjectCopyWithImpl<$Res,
        $Val extends DeeMusiqSearchResponseObject>
    implements $DeeMusiqSearchResponseObjectCopyWith<$Res> {
  _$DeeMusiqSearchResponseObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqSearchResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albums = null,
    Object? artists = null,
    Object? playlists = null,
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      albums: null == albums
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleAlbumObject>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqFullArtistObject>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimplePlaylistObject>,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqFullTrackObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqSearchResponseObjectImplCopyWith<$Res>
    implements $DeeMusiqSearchResponseObjectCopyWith<$Res> {
  factory _$$DeeMusiqSearchResponseObjectImplCopyWith(
          _$DeeMusiqSearchResponseObjectImpl value,
          $Res Function(_$DeeMusiqSearchResponseObjectImpl) then) =
      __$$DeeMusiqSearchResponseObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DeeMusiqSimpleAlbumObject> albums,
      List<DeeMusiqFullArtistObject> artists,
      List<DeeMusiqSimplePlaylistObject> playlists,
      List<DeeMusiqFullTrackObject> tracks});
}

/// @nodoc
class __$$DeeMusiqSearchResponseObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqSearchResponseObjectCopyWithImpl<$Res,
        _$DeeMusiqSearchResponseObjectImpl>
    implements _$$DeeMusiqSearchResponseObjectImplCopyWith<$Res> {
  __$$DeeMusiqSearchResponseObjectImplCopyWithImpl(
      _$DeeMusiqSearchResponseObjectImpl _value,
      $Res Function(_$DeeMusiqSearchResponseObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqSearchResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albums = null,
    Object? artists = null,
    Object? playlists = null,
    Object? tracks = null,
  }) {
    return _then(_$DeeMusiqSearchResponseObjectImpl(
      albums: null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleAlbumObject>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqFullArtistObject>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimplePlaylistObject>,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqFullTrackObject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqSearchResponseObjectImpl
    implements _DeeMusiqSearchResponseObject {
  _$DeeMusiqSearchResponseObjectImpl(
      {required final List<DeeMusiqSimpleAlbumObject> albums,
      required final List<DeeMusiqFullArtistObject> artists,
      required final List<DeeMusiqSimplePlaylistObject> playlists,
      required final List<DeeMusiqFullTrackObject> tracks})
      : _albums = albums,
        _artists = artists,
        _playlists = playlists,
        _tracks = tracks;

  factory _$DeeMusiqSearchResponseObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeeMusiqSearchResponseObjectImplFromJson(json);

  final List<DeeMusiqSimpleAlbumObject> _albums;
  @override
  List<DeeMusiqSimpleAlbumObject> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  final List<DeeMusiqFullArtistObject> _artists;
  @override
  List<DeeMusiqFullArtistObject> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  final List<DeeMusiqSimplePlaylistObject> _playlists;
  @override
  List<DeeMusiqSimplePlaylistObject> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  final List<DeeMusiqFullTrackObject> _tracks;
  @override
  List<DeeMusiqFullTrackObject> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString() {
    return 'DeeMusiqSearchResponseObject(albums: $albums, artists: $artists, playlists: $playlists, tracks: $tracks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqSearchResponseObjectImpl &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_albums),
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(_playlists),
      const DeepCollectionEquality().hash(_tracks));

  /// Create a copy of DeeMusiqSearchResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqSearchResponseObjectImplCopyWith<_$DeeMusiqSearchResponseObjectImpl>
      get copyWith => __$$DeeMusiqSearchResponseObjectImplCopyWithImpl<
          _$DeeMusiqSearchResponseObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqSearchResponseObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqSearchResponseObject
    implements DeeMusiqSearchResponseObject {
  factory _DeeMusiqSearchResponseObject(
          {required final List<DeeMusiqSimpleAlbumObject> albums,
          required final List<DeeMusiqFullArtistObject> artists,
          required final List<DeeMusiqSimplePlaylistObject> playlists,
          required final List<DeeMusiqFullTrackObject> tracks}) =
      _$DeeMusiqSearchResponseObjectImpl;

  factory _DeeMusiqSearchResponseObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqSearchResponseObjectImpl.fromJson;

  @override
  List<DeeMusiqSimpleAlbumObject> get albums;
  @override
  List<DeeMusiqFullArtistObject> get artists;
  @override
  List<DeeMusiqSimplePlaylistObject> get playlists;
  @override
  List<DeeMusiqFullTrackObject> get tracks;

  /// Create a copy of DeeMusiqSearchResponseObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqSearchResponseObjectImplCopyWith<_$DeeMusiqSearchResponseObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqTrackObject _$DeeMusiqTrackObjectFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'local':
      return DeeMusiqLocalTrackObject.fromJson(json);
    case 'full':
      return DeeMusiqFullTrackObject.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DeeMusiqTrackObject',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DeeMusiqTrackObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;
  List<DeeMusiqSimpleArtistObject> get artists =>
      throw _privateConstructorUsedError;
  DeeMusiqSimpleAlbumObject get album => throw _privateConstructorUsedError;
  int get durationMs => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)
        local,
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)
        full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqLocalTrackObject value) local,
    required TResult Function(DeeMusiqFullTrackObject value) full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqLocalTrackObject value)? local,
    TResult? Function(DeeMusiqFullTrackObject value)? full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqLocalTrackObject value)? local,
    TResult Function(DeeMusiqFullTrackObject value)? full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqTrackObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqTrackObjectCopyWith<DeeMusiqTrackObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqTrackObjectCopyWith<$Res> {
  factory $DeeMusiqTrackObjectCopyWith(
          DeeMusiqTrackObject value, $Res Function(DeeMusiqTrackObject) then) =
      _$DeeMusiqTrackObjectCopyWithImpl<$Res, DeeMusiqTrackObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqSimpleArtistObject> artists,
      DeeMusiqSimpleAlbumObject album,
      int durationMs});

  $DeeMusiqSimpleAlbumObjectCopyWith<$Res> get album;
}

/// @nodoc
class _$DeeMusiqTrackObjectCopyWithImpl<$Res, $Val extends DeeMusiqTrackObject>
    implements $DeeMusiqTrackObjectCopyWith<$Res> {
  _$DeeMusiqTrackObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? artists = null,
    Object? album = null,
    Object? durationMs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as DeeMusiqSimpleAlbumObject,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeeMusiqSimpleAlbumObjectCopyWith<$Res> get album {
    return $DeeMusiqSimpleAlbumObjectCopyWith<$Res>(_value.album, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeeMusiqLocalTrackObjectImplCopyWith<$Res>
    implements $DeeMusiqTrackObjectCopyWith<$Res> {
  factory _$$DeeMusiqLocalTrackObjectImplCopyWith(
          _$DeeMusiqLocalTrackObjectImpl value,
          $Res Function(_$DeeMusiqLocalTrackObjectImpl) then) =
      __$$DeeMusiqLocalTrackObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqSimpleArtistObject> artists,
      DeeMusiqSimpleAlbumObject album,
      int durationMs,
      String path});

  @override
  $DeeMusiqSimpleAlbumObjectCopyWith<$Res> get album;
}

/// @nodoc
class __$$DeeMusiqLocalTrackObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqTrackObjectCopyWithImpl<$Res,
        _$DeeMusiqLocalTrackObjectImpl>
    implements _$$DeeMusiqLocalTrackObjectImplCopyWith<$Res> {
  __$$DeeMusiqLocalTrackObjectImplCopyWithImpl(
      _$DeeMusiqLocalTrackObjectImpl _value,
      $Res Function(_$DeeMusiqLocalTrackObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? artists = null,
    Object? album = null,
    Object? durationMs = null,
    Object? path = null,
  }) {
    return _then(_$DeeMusiqLocalTrackObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as DeeMusiqSimpleAlbumObject,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqLocalTrackObjectImpl implements DeeMusiqLocalTrackObject {
  _$DeeMusiqLocalTrackObjectImpl(
      {required this.id,
      required this.name,
      required this.externalUri,
      final List<DeeMusiqSimpleArtistObject> artists = const [],
      required this.album,
      required this.durationMs,
      required this.path,
      final String? $type})
      : _artists = artists,
        $type = $type ?? 'local';

  factory _$DeeMusiqLocalTrackObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqLocalTrackObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String externalUri;
  final List<DeeMusiqSimpleArtistObject> _artists;
  @override
  @JsonKey()
  List<DeeMusiqSimpleArtistObject> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final DeeMusiqSimpleAlbumObject album;
  @override
  final int durationMs;
  @override
  final String path;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeeMusiqTrackObject.local(id: $id, name: $name, externalUri: $externalUri, artists: $artists, album: $album, durationMs: $durationMs, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqLocalTrackObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, externalUri,
      const DeepCollectionEquality().hash(_artists), album, durationMs, path);

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqLocalTrackObjectImplCopyWith<_$DeeMusiqLocalTrackObjectImpl>
      get copyWith => __$$DeeMusiqLocalTrackObjectImplCopyWithImpl<
          _$DeeMusiqLocalTrackObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)
        local,
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)
        full,
  }) {
    return local(id, name, externalUri, artists, album, durationMs, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
  }) {
    return local?.call(id, name, externalUri, artists, album, durationMs, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(id, name, externalUri, artists, album, durationMs, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqLocalTrackObject value) local,
    required TResult Function(DeeMusiqFullTrackObject value) full,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqLocalTrackObject value)? local,
    TResult? Function(DeeMusiqFullTrackObject value)? full,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqLocalTrackObject value)? local,
    TResult Function(DeeMusiqFullTrackObject value)? full,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqLocalTrackObjectImplToJson(
      this,
    );
  }
}

abstract class DeeMusiqLocalTrackObject implements DeeMusiqTrackObject {
  factory DeeMusiqLocalTrackObject(
      {required final String id,
      required final String name,
      required final String externalUri,
      final List<DeeMusiqSimpleArtistObject> artists,
      required final DeeMusiqSimpleAlbumObject album,
      required final int durationMs,
      required final String path}) = _$DeeMusiqLocalTrackObjectImpl;

  factory DeeMusiqLocalTrackObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqLocalTrackObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get externalUri;
  @override
  List<DeeMusiqSimpleArtistObject> get artists;
  @override
  DeeMusiqSimpleAlbumObject get album;
  @override
  int get durationMs;
  String get path;

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqLocalTrackObjectImplCopyWith<_$DeeMusiqLocalTrackObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeeMusiqFullTrackObjectImplCopyWith<$Res>
    implements $DeeMusiqTrackObjectCopyWith<$Res> {
  factory _$$DeeMusiqFullTrackObjectImplCopyWith(
          _$DeeMusiqFullTrackObjectImpl value,
          $Res Function(_$DeeMusiqFullTrackObjectImpl) then) =
      __$$DeeMusiqFullTrackObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String externalUri,
      List<DeeMusiqSimpleArtistObject> artists,
      DeeMusiqSimpleAlbumObject album,
      int durationMs,
      String isrc,
      bool explicit});

  @override
  $DeeMusiqSimpleAlbumObjectCopyWith<$Res> get album;
}

/// @nodoc
class __$$DeeMusiqFullTrackObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqTrackObjectCopyWithImpl<$Res, _$DeeMusiqFullTrackObjectImpl>
    implements _$$DeeMusiqFullTrackObjectImplCopyWith<$Res> {
  __$$DeeMusiqFullTrackObjectImplCopyWithImpl(
      _$DeeMusiqFullTrackObjectImpl _value,
      $Res Function(_$DeeMusiqFullTrackObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? externalUri = null,
    Object? artists = null,
    Object? album = null,
    Object? durationMs = null,
    Object? isrc = null,
    Object? explicit = null,
  }) {
    return _then(_$DeeMusiqFullTrackObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqSimpleArtistObject>,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as DeeMusiqSimpleAlbumObject,
      durationMs: null == durationMs
          ? _value.durationMs
          : durationMs // ignore: cast_nullable_to_non_nullable
              as int,
      isrc: null == isrc
          ? _value.isrc
          : isrc // ignore: cast_nullable_to_non_nullable
              as String,
      explicit: null == explicit
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqFullTrackObjectImpl implements DeeMusiqFullTrackObject {
  _$DeeMusiqFullTrackObjectImpl(
      {required this.id,
      required this.name,
      required this.externalUri,
      final List<DeeMusiqSimpleArtistObject> artists = const [],
      required this.album,
      required this.durationMs,
      required this.isrc,
      required this.explicit,
      final String? $type})
      : _artists = artists,
        $type = $type ?? 'full';

  factory _$DeeMusiqFullTrackObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqFullTrackObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String externalUri;
  final List<DeeMusiqSimpleArtistObject> _artists;
  @override
  @JsonKey()
  List<DeeMusiqSimpleArtistObject> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final DeeMusiqSimpleAlbumObject album;
  @override
  final int durationMs;
  @override
  final String isrc;
  @override
  final bool explicit;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DeeMusiqTrackObject.full(id: $id, name: $name, externalUri: $externalUri, artists: $artists, album: $album, durationMs: $durationMs, isrc: $isrc, explicit: $explicit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqFullTrackObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.isrc, isrc) || other.isrc == isrc) &&
            (identical(other.explicit, explicit) ||
                other.explicit == explicit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      externalUri,
      const DeepCollectionEquality().hash(_artists),
      album,
      durationMs,
      isrc,
      explicit);

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqFullTrackObjectImplCopyWith<_$DeeMusiqFullTrackObjectImpl>
      get copyWith => __$$DeeMusiqFullTrackObjectImplCopyWithImpl<
          _$DeeMusiqFullTrackObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)
        local,
    required TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)
        full,
  }) {
    return full(
        id, name, externalUri, artists, album, durationMs, isrc, explicit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult? Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
  }) {
    return full?.call(
        id, name, externalUri, artists, album, durationMs, isrc, explicit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String path)?
        local,
    TResult Function(
            String id,
            String name,
            String externalUri,
            List<DeeMusiqSimpleArtistObject> artists,
            DeeMusiqSimpleAlbumObject album,
            int durationMs,
            String isrc,
            bool explicit)?
        full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(
          id, name, externalUri, artists, album, durationMs, isrc, explicit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeeMusiqLocalTrackObject value) local,
    required TResult Function(DeeMusiqFullTrackObject value) full,
  }) {
    return full(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeeMusiqLocalTrackObject value)? local,
    TResult? Function(DeeMusiqFullTrackObject value)? full,
  }) {
    return full?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeeMusiqLocalTrackObject value)? local,
    TResult Function(DeeMusiqFullTrackObject value)? full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqFullTrackObjectImplToJson(
      this,
    );
  }
}

abstract class DeeMusiqFullTrackObject implements DeeMusiqTrackObject {
  factory DeeMusiqFullTrackObject(
      {required final String id,
      required final String name,
      required final String externalUri,
      final List<DeeMusiqSimpleArtistObject> artists,
      required final DeeMusiqSimpleAlbumObject album,
      required final int durationMs,
      required final String isrc,
      required final bool explicit}) = _$DeeMusiqFullTrackObjectImpl;

  factory DeeMusiqFullTrackObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqFullTrackObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get externalUri;
  @override
  List<DeeMusiqSimpleArtistObject> get artists;
  @override
  DeeMusiqSimpleAlbumObject get album;
  @override
  int get durationMs;
  String get isrc;
  bool get explicit;

  /// Create a copy of DeeMusiqTrackObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqFullTrackObjectImplCopyWith<_$DeeMusiqFullTrackObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DeeMusiqUserObject _$DeeMusiqUserObjectFromJson(Map<String, dynamic> json) {
  return _DeeMusiqUserObject.fromJson(json);
}

/// @nodoc
mixin _$DeeMusiqUserObject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<DeeMusiqImageObject> get images => throw _privateConstructorUsedError;
  String get externalUri => throw _privateConstructorUsedError;

  /// Serializes this DeeMusiqUserObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeMusiqUserObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeMusiqUserObjectCopyWith<DeeMusiqUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeMusiqUserObjectCopyWith<$Res> {
  factory $DeeMusiqUserObjectCopyWith(
          DeeMusiqUserObject value, $Res Function(DeeMusiqUserObject) then) =
      _$DeeMusiqUserObjectCopyWithImpl<$Res, DeeMusiqUserObject>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<DeeMusiqImageObject> images,
      String externalUri});
}

/// @nodoc
class _$DeeMusiqUserObjectCopyWithImpl<$Res, $Val extends DeeMusiqUserObject>
    implements $DeeMusiqUserObjectCopyWith<$Res> {
  _$DeeMusiqUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeMusiqUserObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? images = null,
    Object? externalUri = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeMusiqUserObjectImplCopyWith<$Res>
    implements $DeeMusiqUserObjectCopyWith<$Res> {
  factory _$$DeeMusiqUserObjectImplCopyWith(_$DeeMusiqUserObjectImpl value,
          $Res Function(_$DeeMusiqUserObjectImpl) then) =
      __$$DeeMusiqUserObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<DeeMusiqImageObject> images,
      String externalUri});
}

/// @nodoc
class __$$DeeMusiqUserObjectImplCopyWithImpl<$Res>
    extends _$DeeMusiqUserObjectCopyWithImpl<$Res, _$DeeMusiqUserObjectImpl>
    implements _$$DeeMusiqUserObjectImplCopyWith<$Res> {
  __$$DeeMusiqUserObjectImplCopyWithImpl(_$DeeMusiqUserObjectImpl _value,
      $Res Function(_$DeeMusiqUserObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeMusiqUserObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? images = null,
    Object? externalUri = null,
  }) {
    return _then(_$DeeMusiqUserObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<DeeMusiqImageObject>,
      externalUri: null == externalUri
          ? _value.externalUri
          : externalUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeMusiqUserObjectImpl implements _DeeMusiqUserObject {
  _$DeeMusiqUserObjectImpl(
      {required this.id,
      required this.name,
      final List<DeeMusiqImageObject> images = const [],
      required this.externalUri})
      : _images = images;

  factory _$DeeMusiqUserObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeMusiqUserObjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<DeeMusiqImageObject> _images;
  @override
  @JsonKey()
  List<DeeMusiqImageObject> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String externalUri;

  @override
  String toString() {
    return 'DeeMusiqUserObject(id: $id, name: $name, images: $images, externalUri: $externalUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeMusiqUserObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.externalUri, externalUri) ||
                other.externalUri == externalUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_images), externalUri);

  /// Create a copy of DeeMusiqUserObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeMusiqUserObjectImplCopyWith<_$DeeMusiqUserObjectImpl> get copyWith =>
      __$$DeeMusiqUserObjectImplCopyWithImpl<_$DeeMusiqUserObjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeMusiqUserObjectImplToJson(
      this,
    );
  }
}

abstract class _DeeMusiqUserObject implements DeeMusiqUserObject {
  factory _DeeMusiqUserObject(
      {required final String id,
      required final String name,
      final List<DeeMusiqImageObject> images,
      required final String externalUri}) = _$DeeMusiqUserObjectImpl;

  factory _DeeMusiqUserObject.fromJson(Map<String, dynamic> json) =
      _$DeeMusiqUserObjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<DeeMusiqImageObject> get images;
  @override
  String get externalUri;

  /// Create a copy of DeeMusiqUserObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeMusiqUserObjectImplCopyWith<_$DeeMusiqUserObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PluginConfiguration _$PluginConfigurationFromJson(Map<String, dynamic> json) {
  return _PluginConfiguration.fromJson(json);
}

/// @nodoc
mixin _$PluginConfiguration {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get entryPoint => throw _privateConstructorUsedError;
  String get pluginApiVersion => throw _privateConstructorUsedError;
  List<PluginApis> get apis => throw _privateConstructorUsedError;
  List<PluginAbilities> get abilities => throw _privateConstructorUsedError;
  String? get repository => throw _privateConstructorUsedError;

  /// Serializes this PluginConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PluginConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PluginConfigurationCopyWith<PluginConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PluginConfigurationCopyWith<$Res> {
  factory $PluginConfigurationCopyWith(
          PluginConfiguration value, $Res Function(PluginConfiguration) then) =
      _$PluginConfigurationCopyWithImpl<$Res, PluginConfiguration>;
  @useResult
  $Res call(
      {String name,
      String description,
      String version,
      String author,
      String entryPoint,
      String pluginApiVersion,
      List<PluginApis> apis,
      List<PluginAbilities> abilities,
      String? repository});
}

/// @nodoc
class _$PluginConfigurationCopyWithImpl<$Res, $Val extends PluginConfiguration>
    implements $PluginConfigurationCopyWith<$Res> {
  _$PluginConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PluginConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? version = null,
    Object? author = null,
    Object? entryPoint = null,
    Object? pluginApiVersion = null,
    Object? apis = null,
    Object? abilities = null,
    Object? repository = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      entryPoint: null == entryPoint
          ? _value.entryPoint
          : entryPoint // ignore: cast_nullable_to_non_nullable
              as String,
      pluginApiVersion: null == pluginApiVersion
          ? _value.pluginApiVersion
          : pluginApiVersion // ignore: cast_nullable_to_non_nullable
              as String,
      apis: null == apis
          ? _value.apis
          : apis // ignore: cast_nullable_to_non_nullable
              as List<PluginApis>,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PluginAbilities>,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PluginConfigurationImplCopyWith<$Res>
    implements $PluginConfigurationCopyWith<$Res> {
  factory _$$PluginConfigurationImplCopyWith(_$PluginConfigurationImpl value,
          $Res Function(_$PluginConfigurationImpl) then) =
      __$$PluginConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String version,
      String author,
      String entryPoint,
      String pluginApiVersion,
      List<PluginApis> apis,
      List<PluginAbilities> abilities,
      String? repository});
}

/// @nodoc
class __$$PluginConfigurationImplCopyWithImpl<$Res>
    extends _$PluginConfigurationCopyWithImpl<$Res, _$PluginConfigurationImpl>
    implements _$$PluginConfigurationImplCopyWith<$Res> {
  __$$PluginConfigurationImplCopyWithImpl(_$PluginConfigurationImpl _value,
      $Res Function(_$PluginConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PluginConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? version = null,
    Object? author = null,
    Object? entryPoint = null,
    Object? pluginApiVersion = null,
    Object? apis = null,
    Object? abilities = null,
    Object? repository = freezed,
  }) {
    return _then(_$PluginConfigurationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      entryPoint: null == entryPoint
          ? _value.entryPoint
          : entryPoint // ignore: cast_nullable_to_non_nullable
              as String,
      pluginApiVersion: null == pluginApiVersion
          ? _value.pluginApiVersion
          : pluginApiVersion // ignore: cast_nullable_to_non_nullable
              as String,
      apis: null == apis
          ? _value._apis
          : apis // ignore: cast_nullable_to_non_nullable
              as List<PluginApis>,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<PluginAbilities>,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PluginConfigurationImpl extends _PluginConfiguration {
  _$PluginConfigurationImpl(
      {required this.name,
      required this.description,
      required this.version,
      required this.author,
      required this.entryPoint,
      required this.pluginApiVersion,
      final List<PluginApis> apis = const [],
      final List<PluginAbilities> abilities = const [],
      this.repository})
      : _apis = apis,
        _abilities = abilities,
        super._();

  factory _$PluginConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PluginConfigurationImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String version;
  @override
  final String author;
  @override
  final String entryPoint;
  @override
  final String pluginApiVersion;
  final List<PluginApis> _apis;
  @override
  @JsonKey()
  List<PluginApis> get apis {
    if (_apis is EqualUnmodifiableListView) return _apis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apis);
  }

  final List<PluginAbilities> _abilities;
  @override
  @JsonKey()
  List<PluginAbilities> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  @override
  final String? repository;

  @override
  String toString() {
    return 'PluginConfiguration(name: $name, description: $description, version: $version, author: $author, entryPoint: $entryPoint, pluginApiVersion: $pluginApiVersion, apis: $apis, abilities: $abilities, repository: $repository)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PluginConfigurationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.entryPoint, entryPoint) ||
                other.entryPoint == entryPoint) &&
            (identical(other.pluginApiVersion, pluginApiVersion) ||
                other.pluginApiVersion == pluginApiVersion) &&
            const DeepCollectionEquality().equals(other._apis, _apis) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            (identical(other.repository, repository) ||
                other.repository == repository));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      version,
      author,
      entryPoint,
      pluginApiVersion,
      const DeepCollectionEquality().hash(_apis),
      const DeepCollectionEquality().hash(_abilities),
      repository);

  /// Create a copy of PluginConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PluginConfigurationImplCopyWith<_$PluginConfigurationImpl> get copyWith =>
      __$$PluginConfigurationImplCopyWithImpl<_$PluginConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PluginConfigurationImplToJson(
      this,
    );
  }
}

abstract class _PluginConfiguration extends PluginConfiguration {
  factory _PluginConfiguration(
      {required final String name,
      required final String description,
      required final String version,
      required final String author,
      required final String entryPoint,
      required final String pluginApiVersion,
      final List<PluginApis> apis,
      final List<PluginAbilities> abilities,
      final String? repository}) = _$PluginConfigurationImpl;
  _PluginConfiguration._() : super._();

  factory _PluginConfiguration.fromJson(Map<String, dynamic> json) =
      _$PluginConfigurationImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get version;
  @override
  String get author;
  @override
  String get entryPoint;
  @override
  String get pluginApiVersion;
  @override
  List<PluginApis> get apis;
  @override
  List<PluginAbilities> get abilities;
  @override
  String? get repository;

  /// Create a copy of PluginConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PluginConfigurationImplCopyWith<_$PluginConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PluginUpdateAvailable _$PluginUpdateAvailableFromJson(
    Map<String, dynamic> json) {
  return _PluginUpdateAvailable.fromJson(json);
}

/// @nodoc
mixin _$PluginUpdateAvailable {
  String get downloadUrl => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String? get changelog => throw _privateConstructorUsedError;

  /// Serializes this PluginUpdateAvailable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PluginUpdateAvailable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PluginUpdateAvailableCopyWith<PluginUpdateAvailable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PluginUpdateAvailableCopyWith<$Res> {
  factory $PluginUpdateAvailableCopyWith(PluginUpdateAvailable value,
          $Res Function(PluginUpdateAvailable) then) =
      _$PluginUpdateAvailableCopyWithImpl<$Res, PluginUpdateAvailable>;
  @useResult
  $Res call({String downloadUrl, String version, String? changelog});
}

/// @nodoc
class _$PluginUpdateAvailableCopyWithImpl<$Res,
        $Val extends PluginUpdateAvailable>
    implements $PluginUpdateAvailableCopyWith<$Res> {
  _$PluginUpdateAvailableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PluginUpdateAvailable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? version = null,
    Object? changelog = freezed,
  }) {
    return _then(_value.copyWith(
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changelog: freezed == changelog
          ? _value.changelog
          : changelog // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PluginUpdateAvailableImplCopyWith<$Res>
    implements $PluginUpdateAvailableCopyWith<$Res> {
  factory _$$PluginUpdateAvailableImplCopyWith(
          _$PluginUpdateAvailableImpl value,
          $Res Function(_$PluginUpdateAvailableImpl) then) =
      __$$PluginUpdateAvailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String downloadUrl, String version, String? changelog});
}

/// @nodoc
class __$$PluginUpdateAvailableImplCopyWithImpl<$Res>
    extends _$PluginUpdateAvailableCopyWithImpl<$Res,
        _$PluginUpdateAvailableImpl>
    implements _$$PluginUpdateAvailableImplCopyWith<$Res> {
  __$$PluginUpdateAvailableImplCopyWithImpl(_$PluginUpdateAvailableImpl _value,
      $Res Function(_$PluginUpdateAvailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of PluginUpdateAvailable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadUrl = null,
    Object? version = null,
    Object? changelog = freezed,
  }) {
    return _then(_$PluginUpdateAvailableImpl(
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changelog: freezed == changelog
          ? _value.changelog
          : changelog // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PluginUpdateAvailableImpl implements _PluginUpdateAvailable {
  _$PluginUpdateAvailableImpl(
      {required this.downloadUrl, required this.version, this.changelog});

  factory _$PluginUpdateAvailableImpl.fromJson(Map<String, dynamic> json) =>
      _$$PluginUpdateAvailableImplFromJson(json);

  @override
  final String downloadUrl;
  @override
  final String version;
  @override
  final String? changelog;

  @override
  String toString() {
    return 'PluginUpdateAvailable(downloadUrl: $downloadUrl, version: $version, changelog: $changelog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PluginUpdateAvailableImpl &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.changelog, changelog) ||
                other.changelog == changelog));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, downloadUrl, version, changelog);

  /// Create a copy of PluginUpdateAvailable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PluginUpdateAvailableImplCopyWith<_$PluginUpdateAvailableImpl>
      get copyWith => __$$PluginUpdateAvailableImplCopyWithImpl<
          _$PluginUpdateAvailableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PluginUpdateAvailableImplToJson(
      this,
    );
  }
}

abstract class _PluginUpdateAvailable implements PluginUpdateAvailable {
  factory _PluginUpdateAvailable(
      {required final String downloadUrl,
      required final String version,
      final String? changelog}) = _$PluginUpdateAvailableImpl;

  factory _PluginUpdateAvailable.fromJson(Map<String, dynamic> json) =
      _$PluginUpdateAvailableImpl.fromJson;

  @override
  String get downloadUrl;
  @override
  String get version;
  @override
  String? get changelog;

  /// Create a copy of PluginUpdateAvailable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PluginUpdateAvailableImplCopyWith<_$PluginUpdateAvailableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MetadataPluginRepository _$MetadataPluginRepositoryFromJson(
    Map<String, dynamic> json) {
  return _MetadataPluginRepository.fromJson(json);
}

/// @nodoc
mixin _$MetadataPluginRepository {
  String get name => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get repoUrl => throw _privateConstructorUsedError;
  List<String> get topics => throw _privateConstructorUsedError;

  /// Serializes this MetadataPluginRepository to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetadataPluginRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetadataPluginRepositoryCopyWith<MetadataPluginRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataPluginRepositoryCopyWith<$Res> {
  factory $MetadataPluginRepositoryCopyWith(MetadataPluginRepository value,
          $Res Function(MetadataPluginRepository) then) =
      _$MetadataPluginRepositoryCopyWithImpl<$Res, MetadataPluginRepository>;
  @useResult
  $Res call(
      {String name,
      String owner,
      String description,
      String repoUrl,
      List<String> topics});
}

/// @nodoc
class _$MetadataPluginRepositoryCopyWithImpl<$Res,
        $Val extends MetadataPluginRepository>
    implements $MetadataPluginRepositoryCopyWith<$Res> {
  _$MetadataPluginRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetadataPluginRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? owner = null,
    Object? description = null,
    Object? repoUrl = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      repoUrl: null == repoUrl
          ? _value.repoUrl
          : repoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataPluginRepositoryImplCopyWith<$Res>
    implements $MetadataPluginRepositoryCopyWith<$Res> {
  factory _$$MetadataPluginRepositoryImplCopyWith(
          _$MetadataPluginRepositoryImpl value,
          $Res Function(_$MetadataPluginRepositoryImpl) then) =
      __$$MetadataPluginRepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String owner,
      String description,
      String repoUrl,
      List<String> topics});
}

/// @nodoc
class __$$MetadataPluginRepositoryImplCopyWithImpl<$Res>
    extends _$MetadataPluginRepositoryCopyWithImpl<$Res,
        _$MetadataPluginRepositoryImpl>
    implements _$$MetadataPluginRepositoryImplCopyWith<$Res> {
  __$$MetadataPluginRepositoryImplCopyWithImpl(
      _$MetadataPluginRepositoryImpl _value,
      $Res Function(_$MetadataPluginRepositoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetadataPluginRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? owner = null,
    Object? description = null,
    Object? repoUrl = null,
    Object? topics = null,
  }) {
    return _then(_$MetadataPluginRepositoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      repoUrl: null == repoUrl
          ? _value.repoUrl
          : repoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataPluginRepositoryImpl implements _MetadataPluginRepository {
  _$MetadataPluginRepositoryImpl(
      {required this.name,
      required this.owner,
      required this.description,
      required this.repoUrl,
      required final List<String> topics})
      : _topics = topics;

  factory _$MetadataPluginRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataPluginRepositoryImplFromJson(json);

  @override
  final String name;
  @override
  final String owner;
  @override
  final String description;
  @override
  final String repoUrl;
  final List<String> _topics;
  @override
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'MetadataPluginRepository(name: $name, owner: $owner, description: $description, repoUrl: $repoUrl, topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataPluginRepositoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.repoUrl, repoUrl) || other.repoUrl == repoUrl) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, owner, description,
      repoUrl, const DeepCollectionEquality().hash(_topics));

  /// Create a copy of MetadataPluginRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataPluginRepositoryImplCopyWith<_$MetadataPluginRepositoryImpl>
      get copyWith => __$$MetadataPluginRepositoryImplCopyWithImpl<
          _$MetadataPluginRepositoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataPluginRepositoryImplToJson(
      this,
    );
  }
}

abstract class _MetadataPluginRepository implements MetadataPluginRepository {
  factory _MetadataPluginRepository(
      {required final String name,
      required final String owner,
      required final String description,
      required final String repoUrl,
      required final List<String> topics}) = _$MetadataPluginRepositoryImpl;

  factory _MetadataPluginRepository.fromJson(Map<String, dynamic> json) =
      _$MetadataPluginRepositoryImpl.fromJson;

  @override
  String get name;
  @override
  String get owner;
  @override
  String get description;
  @override
  String get repoUrl;
  @override
  List<String> get topics;

  /// Create a copy of MetadataPluginRepository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataPluginRepositoryImplCopyWith<_$MetadataPluginRepositoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
