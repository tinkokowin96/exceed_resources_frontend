import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class MOrganization with _$MOrganization {
  factory MOrganization({
    required String id,
    required String name,
    required String logo,
    required String type,
    required String ceoName,
    required String ceoPositionName,
    required String ceoEmail,
    required String ceoPhone,
    @Default([]) List<MDepartment> departments,
    @Default([]) List<MColleague> topManagements,
    @Default([]) List<MAttachment> resources,
    String? ceoPositionShort,
    String? description,
  }) = _MOrganization;

  factory MOrganization.fromJson(Map<String, dynamic> json) => _$MOrganizationFromJson(json);
}
