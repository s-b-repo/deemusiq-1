part of 'metadata.dart';

@freezed
class DeeMusiqUserObject with _$DeeMusiqUserObject {
  factory DeeMusiqUserObject({
    required final String id,
    required final String name,
    @Default([]) final List<DeeMusiqImageObject> images,
    required final String externalUri,
  }) = _DeeMusiqUserObject;

  factory DeeMusiqUserObject.fromJson(Map<String, dynamic> json) =>
      _$DeeMusiqUserObjectFromJson(json);
}
