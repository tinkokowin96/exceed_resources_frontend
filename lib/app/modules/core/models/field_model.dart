import 'package:exceed_resources_frontend/app/modules/core/models/report_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_model.freezed.dart';
part 'field_model.g.dart';

@freezed
class MField with _$MField {
  factory MField({
    @Default('') String id,
    @Default('') String name,
    @Default(EField.string) @JsonKey(name: 'field_type') EField fieldType,
    @JsonKey(name: 'report_value')
        List<MReportField>? reportValue, //if field type is report this is mandatory,  if not null
    dynamic value,
    @Default(false) bool list,
    @Default(false) bool mandatory,
  }) = _MField;

  factory MField.fromJson(Map<String, dynamic> json) => _$MFieldFromJson(json);
}
