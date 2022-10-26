import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_type.freezed.dart';
part 'comment_type.g.dart';

@unfreezed
class CommentType with _$CommentType {
  factory CommentType({
    required String text,
    @JsonKey(name: 'employee_id') String? employeeId,
  }) = _CommentType;

  factory CommentType.fromJson(Map<String, dynamic> json) => _$CommentTypeFromJson(json);
}
