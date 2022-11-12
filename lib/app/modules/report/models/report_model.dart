import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class MReport with _$MReport {
  factory MReport({
    required List<MReportCategory> categories,
    @JsonKey(name: 'basic_salary') required double basicSalary,
    @Default(true) bool earning,
  }) = _MReport;

  factory MReport.fromJson(Map<String, dynamic> json) => _$MReportFromJson(json);
}
