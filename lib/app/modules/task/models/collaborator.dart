import 'package:exceed_resources_frontend/app/modules/misc/models/employee.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator.freezed.dart';
part 'collaborator.g.dart';

@freezed
class Collaborator with _$Collaborator {
  factory Collaborator({
    required String id,
    required Employee employee,
    required Role role,
    @Default([]) @JsonKey(name: 'allowed_resources') List<String> allowedResources,
    String? remark,
  }) = _Collaborator;

  factory Collaborator.fromJson(Map<String, dynamic> json) => _$CollaboratorFromJson(json);
}
