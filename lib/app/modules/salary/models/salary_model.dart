import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/salary/models/salary_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_model.freezed.dart';
part 'salary_model.g.dart';

@freezed
class MSalary with _$MSalary {
  factory MSalary({
    @Default('') String id,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    MSalaryCategory? category,
  }) = _MSalary;

  factory MSalary.fromJson(Map<String, dynamic> json) => _$MSalaryFromJson(json);
}
