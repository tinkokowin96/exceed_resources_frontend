import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class MTask with _$MTask {
  factory MTask({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    MStatus? status,
    MPriority? priority,
    MProject? project,
    @Default([]) List<MCollaborator> collaborators,
    @JsonKey(name: 'assigned_by') MCollaborator? assignedBy,
    @JsonKey(name: 'assigned_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? assignedDate,
    @JsonKey(name: 'due_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? dueDate,
    @Default([]) List<String> attachments,
    @Default([]) List<MComment> comments,
    @Default([]) List<String> urls,
    MPhase? phase,
    MQuotation? quotation,
    EExtra? reward,
  }) = _MTask;

  factory MTask.fromJson(Map<String, dynamic> json) => _$MTaskFromJson(json);
}
