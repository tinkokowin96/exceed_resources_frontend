import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

/// mentions  format will be like.<men>{{user_id:name}} </men>
/// eg. Contrary to popular belief, <men>{{user_id:name}}</men>Lorem Ipsum is not simply random text

@freezed
class Comment with _$Comment {
  factory Comment({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String text,
    @JsonKey(name: 'num_like') required int numLike,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}