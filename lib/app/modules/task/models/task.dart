import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required String name,
    required String description,
    required Status status,
    required Priority priority,
    required ProjectM project,
    required List<CollaboratorM> collaborators,
    @JsonKey(name: 'assigned_by') required CollaboratorM assignedBy,
    @JsonKey(name: 'assigned_date') required DateTime assignedDate,
    @JsonKey(name: 'due_date') required DateTime dueDate,
    @Default([]) List<String> attachments,
    @Default([]) List<Comment> comments,
    PhaseM? phase,
    QuotationM? quotation,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
