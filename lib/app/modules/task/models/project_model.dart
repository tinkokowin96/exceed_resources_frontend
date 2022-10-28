import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class MProject with _$MProject {
  factory MProject({
    required String id,
    required String name,
    required MPhaseM phase,
    @JsonKey(name: 'num_new_task') required int numNewTask,
    @JsonKey(name: 'num_progress_task') required int numProgressTask,
    @JsonKey(name: 'num_overdue_task') required int numOverdueTask,
    @JsonKey(name: 'num_completed_task') required int numCompletedTask,
    @Default([]) List<MQuotation> quotations,
    @Default([]) List<MCollaboratorM> collaborators,
    @Default([]) List<String> resources,
    @Default([]) List<MTask> tasks,
    String? remark,
  }) = _MProject;

  factory MProject.fromJson(Map<String, dynamic> json) => _$MProjectFromJson(json);
}
