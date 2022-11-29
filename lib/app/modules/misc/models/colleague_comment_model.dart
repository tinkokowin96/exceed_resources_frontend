import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_comment_model.freezed.dart';
part 'colleague_comment_model.g.dart';

@freezed
class MColleagueComment with _$MColleagueComment {
  factory MColleagueComment({
    @Default('') String id,
    @Default('') String text,
    @Default('') @JsonKey(name: 'commenter_id') String commenterId,
    @Default('') @JsonKey(name: 'colleague_id') String colleagueId,
  }) = _MColleagueComment;

  factory MColleagueComment.fromJson(Map<String, dynamic> json) => _$MColleagueCommentFromJson(json);
}
