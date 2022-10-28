import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_comment_model.freezed.dart';
part 'employee_comment_model.g.dart';

@freezed
class MEmployeeComment with _$MEmployeeComment {
  factory MEmployeeComment({
    required String id,
    required String text,
    @JsonKey(name: 'commenter_id') required String commenterId,
    @JsonKey(name: 'employee_id') required String employeeId,
  }) = _MEmployeeComment;

  factory MEmployeeComment.fromJson(Map<String, dynamic> json) => _$MEmployeeCommentFromJson(json);
}
