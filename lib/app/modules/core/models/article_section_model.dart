import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_section_model.freezed.dart';
part 'article_section_model.g.dart';

@freezed
class MArticleSection with _$MArticleSection {
  factory MArticleSection({
    @Default(EDynamicField.body) EDynamicField type,
    @Default([]) List<String> data,
  }) = _MArticleSection;

  factory MArticleSection.fromJson(Map<String, dynamic> json) => _$MArticleSectionFromJson(json);
}
