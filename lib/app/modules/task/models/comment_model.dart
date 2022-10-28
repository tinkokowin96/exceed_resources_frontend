import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class MComment with _$MComment {
  factory MComment({
    String? id,
    List<MAttachment>? attachments,
    @JsonKey(
      name: 'updated_at',
      fromJson: dateFromJson,
    )
        DateTime? updatedAt,
    @JsonKey(name: 'text_comment')
        List<MCommentType>? textComment,
    @JsonKey(name: 'commented_by')
        required MEmployeeM commentedBy,
    @JsonKey(name: 'num_like')
        required int numLike,
    @Default(false)
        bool liked,
    @JsonKey(name: 'my_comment')
    @Default(false)
        bool myComment,
  }) = _MComment;

  factory MComment.fromJson(Map<String, dynamic> json) => _$MCommentFromJson(json);
}
