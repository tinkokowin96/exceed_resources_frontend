import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_m.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator_m.freezed.dart';
part 'collaborator_m.g.dart';

@freezed
class CollaboratorM with _$CollaboratorM {
  factory CollaboratorM({
    required String id,
    required EmployeeM employee,
    required RoleM role,
  }) = _CollaboratorM;

  factory CollaboratorM.fromJson(Map<String, dynamic> json) => _$CollaboratorMFromJson(json);
}
