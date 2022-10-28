import 'package:exceed_resources_frontend/app/modules/misc/models/employee_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator_model.freezed.dart';
part 'collaborator_model.g.dart';

@freezed
class MCollaborator with _$MCollaborator {
  factory MCollaborator({
    required String id,
    required MEmployee employee,
    required MRole role,
    @Default([]) @JsonKey(name: 'allowed_resources') List<String> allowedResources,
    String? remark,
  }) = _MCollaborator;

  factory MCollaborator.fromJson(Map<String, dynamic> json) => _$MCollaboratorFromJson(json);
}
