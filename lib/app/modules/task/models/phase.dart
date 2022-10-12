import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase.freezed.dart';
part 'phase.g.dart';

@freezed
class Phase with _$Phase {
  factory Phase({
    required String id,
    required String name,
    @Default([]) List<Role> roles,
    @Default([]) List<Collaborator> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    int? duration,
    String? remark,
  }) = _Phase;

  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);
}
