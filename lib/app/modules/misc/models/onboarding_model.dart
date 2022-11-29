import 'package:exceed_resources_frontend/app/modules/core/models/article_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';
part 'onboarding_model.g.dart';

@freezed
class MOnboarding with _$MOnboarding {
  factory MOnboarding({
    @Default('') String id,
    MAttachment? attachment,
    MArticle? article,
  }) = _MOnboarding;

  factory MOnboarding.fromJson(Map<String, dynamic> json) => _$MOnboardingFromJson(json);
}
