import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_field_model.freezed.dart';
part 'report_field_model.g.dart';

@freezed
class MReportField with _$MReportField {
  factory MReportField({
    @JsonKey(name: 'report_type') EField? reportType, //this must be colleague, position or department
    dynamic value,
  }) = _MReportField;

  factory MReportField.fromJson(Map<String, dynamic> json) => _$MReportFieldFromJson(json);
}
