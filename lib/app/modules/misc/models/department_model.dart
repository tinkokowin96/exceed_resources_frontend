import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_permission_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_model.freezed.dart';
part 'department_model.g.dart';

@freezed
class MDepartment with _$MDepartment {
  factory MDepartment({
    @Default('') String id,
    @Default('') String name,
    @Default('') @JsonKey(name: 'short_name') String shortName,
    @Default([]) List<MColleague> executives,
    @Default([]) List<MColleague> colleagues,
    @Default([]) List<MDepartment> departments,
    @Default([]) List<EPermission> permissions,
    @Default([]) List<MAttachment> attachments,
    @Default('') String remark,
    MColleaguePermission? colleaguePermission,
  }) = _MDepartment;

  factory MDepartment.fromJson(Map<String, dynamic> json) => _$MDepartmentFromJson(json);
}
