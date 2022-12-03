import 'package:exceed_resources_frontend/app/modules/salary/models/salary_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_model.freezed.dart';
part 'salary_model.g.dart';

@freezed
class MSalary with _$MSalary {
  factory MSalary({
    @Default([]) List<MSalaryCategory> categories,
    @Default(0) @JsonKey(name: 'basic_salary') double basicSalary,
    @Default(0) @JsonKey(name: 'total_earning') double totalEarning,
    @Default(0) @JsonKey(name: 'total_deduction') double totalDeduction,
  }) = _MSalary;

  factory MSalary.fromJson(Map<String, dynamic> json) => _$MSalaryFromJson(json);
}
