import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'priority_model.freezed.dart';
part 'priority_model.g.dart';

@freezed
class MPriority with _$MPriority {
  factory MPriority({
    @Default('') String id,
    @Default('') String name,
    @JsonKey(name: 'color', fromJson: colorFromJson, toJson: colorToJson) Color? color,
  }) = _MPriority;

  factory MPriority.fromJson(Map<String, dynamic> json) => _$MPriorityFromJson(json);
}
