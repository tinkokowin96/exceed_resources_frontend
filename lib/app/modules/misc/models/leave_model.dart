import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/leave_form_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/extra_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

@freezed
class MLeave with _$MLeave {
  factory MLeave({
    @Default('') String? id,
    @Default('') String? name,
    @Default(true) bool allowAllColleagues,
    @Default([]) List<MDepartment> allowedDepartments,
    @Default('') @JsonKey(name: 'short_name') String shortName,
    @Default(0) @JsonKey(name: 'default_allowed') int defaultAllowed,
    @JsonKey(name: 'color', fromJson: colorFromJson, toJson: colorToJson) Color? color,
    @JsonKey(name: 'leave_form') MLeaveForm? leaveForm,
    MExtra? penalty, //penalty for unpaid leave
    @Default(false) bool form,
    @Default('') String? remark,
  }) = _MLeave;

  factory MLeave.fromJson(Map<String, dynamic> json) => _$MLeaveFromJson(json);
}
