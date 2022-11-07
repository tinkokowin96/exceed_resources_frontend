import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_text_model.freezed.dart';
part 'comment_text_model.g.dart';

@unfreezed
class MCommentText with _$MCommentText {
  factory MCommentText({
    required String text,
    @JsonKey(name: 'colleague_id') String? colleagueId,
  }) = _MCommentText;

  factory MCommentText.fromJson(Map<String, dynamic> json) => _$MCommentTextFromJson(json);
}
