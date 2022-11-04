import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_comment_model.freezed.dart';
part 'colleague_comment_model.g.dart';

@freezed
class MColleagueComment with _$MColleagueComment {
  factory MColleagueComment({
    required String id,
    required String text,
    @JsonKey(name: 'commenter_id') required String commenterId,
    @JsonKey(name: 'colleague_id') required String colleagueId,
  }) = _MColleagueComment;

  factory MColleagueComment.fromJson(Map<String, dynamic> json) => _$MColleagueCommentFromJson(json);
}
