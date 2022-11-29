import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class MReport with _$MReport {
  factory MReport({
    @Default([]) List<MReportCategory> categories,
    @Default(0) @JsonKey(name: 'basic_salary') double basicSalary,
    @Default(0) @JsonKey(name: 'total_earning') double totalEarning,
    @Default(0) @JsonKey(name: 'total_deduction') double totalDeduction,
  }) = _MReport;

  factory MReport.fromJson(Map<String, dynamic> json) => _$MReportFromJson(json);
}
