import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator_model.freezed.dart';
part 'collaborator_model.g.dart';

@freezed
class MCollaborator with _$MCollaborator {
  factory MCollaborator({
    @Default('') String id,
    MColleague? colleague,
    MRole? role,
    @Default([]) List<MAttachment> attachments,
    @Default('') String remark,
  }) = _MCollaborator;

  factory MCollaborator.fromJson(Map<String, dynamic> json) => _$MCollaboratorFromJson(json);
}
