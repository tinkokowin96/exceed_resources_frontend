import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/salary/models/salary_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_salary_model.freezed.dart';
part 'colleague_salary_model.g.dart';

@freezed
class MColleagueSalary with _$MColleagueSalary {
  factory MColleagueSalary({
    @Default('') String id,
    MColleague? colleague,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    @Default([]) List<MSalaryCategory> categories,
    @Default(0) @JsonKey(name: 'basic_salary') double basicSalary,
    @Default(0) @JsonKey(name: 'total_earning') double totalEarning,
    @Default(0) @JsonKey(name: 'total_deduction') double totalDeduction,
  }) = _MColleagueSalary;

  factory MColleagueSalary.fromJson(Map<String, dynamic> json) => _$MColleagueSalaryFromJson(json);
}
