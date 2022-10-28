import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_m_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_model.freezed.dart';
part 'quotation_model.g.dart';

@freezed
class MQuotation with _$MQuotation {
  factory MQuotation({
    required String id,
    required String name,
    required double budget,
    required double expense,
    @Default([]) List<MRoleM> roles,
    @Default([]) List<MCollaboratorM> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    String? remark,
  }) = _MQuotation;

  factory MQuotation.fromJson(Map<String, dynamic> json) => _$MQuotationFromJson(json);
}
