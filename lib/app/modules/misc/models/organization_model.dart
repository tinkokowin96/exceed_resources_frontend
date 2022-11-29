import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class MOrganization with _$MOrganization {
  factory MOrganization({
    @Default('') String id,
    @Default('') String name,
    @Default('') String logo,
    @Default('') String type,
    @Default('') String ceoName,
    @Default('') String ceoImage,
    @Default('') String ceoPositionName,
    @Default('') String ceoEmail,
    @Default('') String ceoPhone,
    @Default([]) List<MDepartment> departments,
    @Default([]) List<MColleague> topManagements,
    @Default([]) List<MAttachment> resources,
    @Default('') String ceoPositionShort,
    @Default('') String description,
  }) = _MOrganization;

  factory MOrganization.fromJson(Map<String, dynamic> json) => _$MOrganizationFromJson(json);
}
