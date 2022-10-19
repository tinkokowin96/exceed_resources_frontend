import 'package:exceed_resources_frontend/app/modules/task/models/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_m.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation.freezed.dart';
part 'quotation.g.dart';

@freezed
class Quotation with _$Quotation {
  factory Quotation({
    required String id,
    required String name,
    required double budget,
    required double expense,
    @Default([]) List<RoleM> roles,
    @Default([]) List<CollaboratorM> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    String? remark,
  }) = _Quotation;

  factory Quotation.fromJson(Map<String, dynamic> json) => _$QuotationFromJson(json);
}
