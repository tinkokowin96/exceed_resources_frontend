import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class MTask with _$MTask {
  factory MTask({
    required String id,
    required String name,
    required String description,
    required MStatus status,
    required MPriority priority,
    required MProjectM project,
    required List<MCollaboratorM> collaborators,
    @JsonKey(name: 'assigned_by') required MCollaboratorM assignedBy,
    @JsonKey(name: 'assigned_date') required DateTime assignedDate,
    @JsonKey(name: 'due_date') required DateTime dueDate,
    @Default([]) List<String> attachments,
    @Default([]) List<MComment> comments,
    @Default([]) List<String> urls,
    MPhaseM? phase,
    MQuotationM? quotation,
  }) = _MTask;

  factory MTask.fromJson(Map<String, dynamic> json) => _$MTaskFromJson(json);
}
