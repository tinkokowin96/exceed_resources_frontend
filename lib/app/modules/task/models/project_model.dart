import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class MProject with _$MProject {
  factory MProject({
    @Default('') String id,
    @Default('') String name,
    MPhase? phase,
    @Default(0) @JsonKey(name: 'num_new_task') int numNewTask,
    @Default(0) @JsonKey(name: 'num_progress_task') int numProgressTask,
    @Default(0) @JsonKey(name: 'num_overdue_task') int numOverdueTask,
    @Default(0) @JsonKey(name: 'num_completed_task') int numCompletedTask,
    @Default([]) List<MQuotation> quotations,
    @Default([]) List<MCollaborator> collaborators,
    @Default([]) List<String> resources,
    @Default([]) List<MTask> tasks,
    @Default('') String remark,
  }) = _MProject;

  factory MProject.fromJson(Map<String, dynamic> json) => _$MProjectFromJson(json);
}
