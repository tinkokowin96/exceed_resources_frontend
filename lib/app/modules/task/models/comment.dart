import 'package:exceed_resources_frontend/app/modules/core/models/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    String? id,
    List<Attachment>? attachments,
    @JsonKey(
      name: 'updated_at',
      fromJson: dateFromJson,
    )
        DateTime? updatedAt,
    @JsonKey(name: 'text_comment')
        List<CommentType>? textComment,
    @JsonKey(name: 'commented_by')
        required EmployeeM commentedBy,
    @JsonKey(name: 'num_like')
        required int numLike,
    @Default(false)
        bool liked,
    @JsonKey(name: 'my_comment')
    @Default(false)
        bool myComment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

DateTime dateFromJson(String json) => DateTime.parse(json);
