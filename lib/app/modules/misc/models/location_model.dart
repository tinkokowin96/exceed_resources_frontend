import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationM with _$LocationM {
  factory LocationM({
    required double lat,
    required double lng,
  }) = _LocationM;

  factory LocationM.fromJson(Map<String, dynamic> json) => _$LocationMFromJson(json);
}
