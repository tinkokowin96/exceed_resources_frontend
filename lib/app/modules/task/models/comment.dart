import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required String id,
    required List<CommentType> comment,
    @JsonKey(name: 'commented_by') required EmployeeM commentedBy,
    @JsonKey(name: 'num_like') required int numLike,
    @Default(false) bool liked,
    @JsonKey(name: 'my_comment') @Default(false) bool myComment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
