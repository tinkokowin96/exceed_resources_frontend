import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:flutter/material.dart';
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
