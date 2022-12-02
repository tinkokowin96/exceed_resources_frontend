import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class MEvent with _$MEvent {
  factory MEvent({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String url,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'effective_date') DateTime? effectiveDate,
    @Default(false) @JsonKey(name: 'show_in_home') bool showInHome,
    @Default(true) @JsonKey(name: 'added_to_calender') bool addedToCalender,
    @JsonKey(name: 'color', fromJson: colorFromJson, toJson: colorToJson) Color? color,
    @JsonKey(name: 'repeat_type') ERepeat? repeatType,
    @JsonKey(name: 'repeat_every') dynamic repeatEvery, // EWeekDay, EMonthDay or int
    @JsonKey(name: 'payment_type') List<MType>? paymentType,
    @JsonKey(name: 'notify_to') List? notifyTo, //colleagues, departments, postions and null for all
    @JsonKey(name: 'created_by') MColleague? createdBy,
    MType? type,
    MAttachment? image,
  }) = _MEvent;

  factory MEvent.fromJson(Map<String, dynamic> json) => _$MEventFromJson(json);
}
