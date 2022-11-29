import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_status_model.freezed.dart';
part 'colleague_status_model.g.dart';

@freezed
class ColleagueStatusM with _$ColleagueStatusM {
  factory ColleagueStatusM({
    @Default('') String name,
    @JsonKey(name: 'until', fromJson: dateFromJson, toJson: dateToJson) DateTime? until,
    @JsonKey(name: 'color', fromJson: colorFromJson, toJson: colorToJson) Color? color,
    LocationM? location,
    @Default('') String remark,
  }) = _ColleagueStatusM;

  factory ColleagueStatusM.fromJson(Map<String, dynamic> json) => _$ColleagueStatusMFromJson(json);
}
