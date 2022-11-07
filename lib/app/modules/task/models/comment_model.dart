import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class MComment with _$MComment {
  factory MComment({
    String? id,
    @JsonKey(name: 'comment_attachments')
        List<MAttachment>? commentAttachments,
    @JsonKey(
      name: 'updated_at',
      fromJson: dateFromJson,
    )
        DateTime? updatedAt,
    @JsonKey(name: 'comment_texts')
        List<MCommentText>? commentTexts,
    @JsonKey(name: 'commented_by')
        required MColleagueM commentedBy,
    @JsonKey(name: 'num_like')
        required int numLike,
    @Default(false)
        bool liked,
  }) = _MComment;

  factory MComment.fromJson(Map<String, dynamic> json) => _$MCommentFromJson(json);
}
