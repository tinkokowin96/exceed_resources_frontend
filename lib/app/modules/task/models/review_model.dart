import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class MReview with _$MReview {
  factory MReview({
    @Default('') String id,
    @Default([]) @JsonKey(name: 'comment_attachments') List<MAttachment> commentAttachments,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) DateTime? updatedAt,
    @Default([]) @JsonKey(name: 'comment_texts') List<MCommentText> commentTexts,
    @JsonKey(name: 'commented_by') MColleague? commentedBy,
    @JsonKey(name: 'commented_to') MColleague? commentedTo,
    @Default(0) @JsonKey(name: 'num_like') int numLike,
    @Default(0) @JsonKey(name: 'num_dislike') int numDislike,
  }) = _MReview;

  factory MReview.fromJson(Map<String, dynamic> json) => _$MReviewFromJson(json);
}
