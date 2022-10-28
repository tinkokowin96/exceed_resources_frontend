import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_m_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator_m_model.freezed.dart';
part 'collaborator_m_model.g.dart';

@freezed
class MCollaboratorM with _$MCollaboratorM {
  factory MCollaboratorM({
    required String id,
    required MEmployeeM employee,
    required MRoleM role,
  }) = _MCollaboratorM;

  factory MCollaboratorM.fromJson(Map<String, dynamic> json) => _$MCollaboratorMFromJson(json);
}
