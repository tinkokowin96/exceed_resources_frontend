import 'package:exceed_resources_frontend/app/modules/misc/models/employee.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String id,
    required String name,
    @Default([]) List<Quotation> quotations,
    @Default([]) List<Collaborator> collaborators,
    @Default([]) List<String> resources,
    String? remark,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}
