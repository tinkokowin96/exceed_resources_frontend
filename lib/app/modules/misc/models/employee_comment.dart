import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_comment.freezed.dart';
part 'employee_comment.g.dart';

@freezed
class EmployeeComment with _$EmployeeComment {
  factory EmployeeComment({
    required String id,
    required String text,
    @JsonKey(name: 'commenter_id') required String commenterId,
    @JsonKey(name: 'employee_id') required String employeeId,
  }) = _EmployeeComment;

  factory EmployeeComment.fromJson(Map<String, dynamic> json) => _$EmployeeCommentFromJson(json);
}
