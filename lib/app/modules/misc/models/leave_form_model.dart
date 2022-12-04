import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_form_model.freezed.dart';
part 'leave_form_model.g.dart';

@freezed
class MLeaveForm with _$MLeaveForm {
  factory MLeaveForm({
    @Default('') String? id,
    @Default(0) @JsonKey(name: 'num_day') double numDay,
    @Default([]) @JsonKey(name: 'form_fields') List<MField> formFields,
    @JsonKey(name: 'start_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? startDate,
    @JsonKey(name: 'end_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? endDate,
    @Default('') String? remark,
    @Default(false) bool form,
  }) = _MLeaveForm;

  factory MLeaveForm.fromJson(Map<String, dynamic> json) => _$MLeaveFormFromJson(json);
}
