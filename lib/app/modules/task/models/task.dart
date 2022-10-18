import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/quotation.dart';
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
    required Project project,
    required List<Collaborator> collaborators,
    @JsonKey(name: 'assigned_by') required Collaborator assignedBy,
    @JsonKey(name: 'assigned_date') required DateTime assignedDate,
    @JsonKey(name: 'due_date') required DateTime dueDate,
    @Default([]) List<String> attachments,
    @Default([]) List<Comment> comments,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    Phase? phase,
    Quotation? quotation,
    int? duration,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
