import 'package:exceed_resources_frontend/app/modules/core/models/article_section_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class MArticle with _$MArticle {
  factory MArticle({
    @Default('') String id,
    @Default('') String title,
    @Default('') String image,
    @Default([]) List<MArticleSection> sections,
  }) = _MArticle;

  factory MArticle.fromJson(Map<String, dynamic> json) => _$MArticleFromJson(json);
}
