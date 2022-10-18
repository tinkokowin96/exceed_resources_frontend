import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    required String id,
    required String name,
    required Phase phase,
    @JsonKey(name: 'num_new_task') required int numNewTask,
    @JsonKey(name: 'num_progress_task') required int numProgressTask,
    @JsonKey(name: 'num_overdue_task') required int numOverdueTask,
    @JsonKey(name: 'num_completed_task') required int numCompletedTask,
    @Default([]) List<Task> tasks,
    @Default([]) List<Quotation> quotations,
    @Default([]) List<Collaborator> collaborators,
    @Default([]) List<String> resources,
    String? remark,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}
