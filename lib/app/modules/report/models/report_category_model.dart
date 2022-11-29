import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_category_model.freezed.dart';
part 'report_category_model.g.dart';

@freezed
class MReportCategory with _$MReportCategory {
  factory MReportCategory({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<List<MField>> fields,
    @Default(true) bool earning,
    @Default('') String remark,
  }) = _MReportCategory;

  factory MReportCategory.fromJson(Map<String, dynamic> json) => _$MReportCategoryFromJson(json);
}
