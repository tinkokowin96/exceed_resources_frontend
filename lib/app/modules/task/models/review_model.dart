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
    @Default([]) List<MAttachment> attachments,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) DateTime? updatedAt,
    @Default([]) @JsonKey(name: 'review_text') List<MCommentText> reviewText,
    @JsonKey(name: 'review_by') MColleague? reviewBy,
    @JsonKey(name: 'review_to') MColleague? reviewTo,
    @Default(0) @JsonKey(name: 'num_like') int numLike,
    @Default(0) @JsonKey(name: 'num_dislike') int numDislike,
  }) = _MReview;

  factory MReview.fromJson(Map<String, dynamic> json) => _$MReviewFromJson(json);
}
