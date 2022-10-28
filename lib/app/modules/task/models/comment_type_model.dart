import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_type_model.freezed.dart';
part 'comment_type_model.g.dart';

@unfreezed
class MCommentType with _$MCommentType {
  factory MCommentType({
    required String text,
    @JsonKey(name: 'employee_id') String? employeeId,
  }) = _MCommentType;

  factory MCommentType.fromJson(Map<String, dynamic> json) => _$MCommentTypeFromJson(json);
}
