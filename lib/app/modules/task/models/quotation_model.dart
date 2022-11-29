import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/role_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_model.freezed.dart';
part 'quotation_model.g.dart';

@freezed
class MQuotation with _$MQuotation {
  factory MQuotation({
    @Default('') String id,
    @Default('') String name,
    @Default(0) double budget,
    @Default(0) double expense,
    @Default([]) List<MRole> roles,
    @Default([]) List<MCollaborator> collaborators,
    @Default([]) List<String> resources,
    @JsonKey(name: 'start_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? startDate,
    @JsonKey(name: 'end_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? endDate,
    @Default('') String remark,
  }) = _MQuotation;

  factory MQuotation.fromJson(Map<String, dynamic> json) => _$MQuotationFromJson(json);
}
