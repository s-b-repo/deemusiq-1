part of 'metadata.dart';

@Freezed(genericArgumentFactories: true)
class DeeMusiqPaginationResponseObject<T>
    with _$DeeMusiqPaginationResponseObject<T> {
  factory DeeMusiqPaginationResponseObject({
    required int limit,
    required int? nextOffset,
    required int total,
    required bool hasMore,
    required List<T> items,
  }) = _DeeMusiqPaginationResponseObject<T>;

  factory DeeMusiqPaginationResponseObject.fromJson(
    Map<String, Object?> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) =>
      _$DeeMusiqPaginationResponseObjectFromJson<T>(
        json,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
}
