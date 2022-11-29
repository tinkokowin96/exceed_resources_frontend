import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_model.freezed.dart';
part 'status_model.g.dart';

@freezed
class MStatus with _$MStatus {
  factory MStatus({
    @Default('') String id,
    @Default('') String name,
    @JsonKey(name: 'color', fromJson: colorFromJson, toJson: colorToJson) Color? color,
  }) = _MStatus;

  factory MStatus.fromJson(Map<String, dynamic> json) => _$MStatusFromJson(json);
}
