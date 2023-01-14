import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class MRole with _$MRole {
  factory MRole({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<MCollaborator> collaborators,
    @Default([]) List<MAttachment> attachments,
    @Default('') String remark,
  }) = _MRole;

  factory MRole.fromJson(Map<String, dynamic> json) => _$MRoleFromJson(json);
}
