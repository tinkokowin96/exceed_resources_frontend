import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase_model.freezed.dart';
part 'phase_model.g.dart';

@freezed
class MPhase with _$MPhase {
  factory MPhase({
    required String id,
    required String name,
    @Default([]) List<MRole> roles,
    @Default([]) List<MCollaborator> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    String? remark,
  }) = _MPhase;

  factory MPhase.fromJson(Map<String, dynamic> json) => _$MPhaseFromJson(json);
}
