import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase_model.freezed.dart';
part 'phase_model.g.dart';

@freezed
class MPhase with _$MPhase {
  factory MPhase({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<MRole> roles,
    @Default([]) List<MCollaborator> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? startDate,
    @JsonKey(name: 'end_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? endDate,
    @Default('') String remark,
  }) = _MPhase;

  factory MPhase.fromJson(Map<String, dynamic> json) => _$MPhaseFromJson(json);
}
