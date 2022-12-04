import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overtime_form_model.freezed.dart';
part 'overtime_form_model.g.dart';

@freezed
class MOvertimeForm with _$MOvertimeForm {
  factory MOvertimeForm({
    @Default('') String? id,
    @Default([]) @JsonKey(name: 'form_fields') List<MField> formFields,
    @Default([]) @JsonKey(name: 'report_to') List<MColleague> reportTo,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    @JsonKey(name: 'start_time', fromJson: dateFromJson, toJson: dateToJson) DateTime? startTime,
    @JsonKey(name: 'end_time', fromJson: dateFromJson, toJson: dateToJson) DateTime? endTime,
    @Default('') String? remark,
  }) = _MOvertimeForm;

  factory MOvertimeForm.fromJson(Map<String, dynamic> json) => _$MOvertimeFormFromJson(json);
}
