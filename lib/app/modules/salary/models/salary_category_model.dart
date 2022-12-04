import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_category_model.freezed.dart';
part 'salary_category_model.g.dart';

@freezed
class MSalaryCategory with _$MSalaryCategory {
  factory MSalaryCategory({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<List<MField>> fields,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    @Default(true) bool earning,
    @Default('') String remark,
    @Default(false) bool form,
  }) = _MSalaryCategory;

  factory MSalaryCategory.fromJson(Map<String, dynamic> json) => _$MSalaryCategoryFromJson(json);
}
