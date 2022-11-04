import 'package:exceed_resources_frontend/app/modules/core/models/permission_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_model.freezed.dart';
part 'department_model.g.dart';

@freezed
class MDepartment with _$MDepartment {
  factory MDepartment({
    required String id,
    required String name,
    @Default([]) List<MColleague> colleagues,
    @Default([]) List<MPermission> permissions,
    List<String>? resources,
    String? remark,
  }) = _MDepartment;

  factory MDepartment.fromJson(Map<String, dynamic> json) => _$MDepartmentFromJson(json);
}
