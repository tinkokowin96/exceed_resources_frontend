import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_permission_model.freezed.dart';
part 'colleague_permission_model.g.dart';

@freezed
class MColleaguePermission with _$MColleaguePermission {
  factory MColleaguePermission({
    @Default([]) @JsonKey(name: 'for_positions') List<MPosition> forPositions,
    @Default([]) @JsonKey(name: 'for_departments') List<MDepartment> forDepartments,
    @Default(false) @JsonKey(name: 'basic_salary') bool basicSalary,
    @Default(false) @JsonKey(name: 'current_earning') bool currentEarning,
    @Default(false) bool resources,
    @Default(false) @JsonKey(name: 'read_comment') bool readComment,
    @Default(false) @JsonKey(name: 'write_comment') bool writeComment,
    @Default(false) @JsonKey(name: 'performance_point') bool performancePoint,
    @Default(false) bool payrise,
    @Default(false) bool resign,
    @Default(false) bool history,
    @Default(false) bool permission,
  }) = _MColleaguePermission;

  factory MColleaguePermission.fromJson(Map<String, dynamic> json) => _$MColleaguePermissionFromJson(json);
}
