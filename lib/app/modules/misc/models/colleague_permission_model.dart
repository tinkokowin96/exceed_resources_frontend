import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_permission_model.freezed.dart';
part 'colleague_permission_model.g.dart';

@freezed
class MColleaguePermission with _$MColleaguePermission {
  factory MColleaguePermission({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<MPosition> positions,
    @Default([]) List<MDepartment> departments,
    @Default(false) bool allowAll,
    @Default([]) @JsonKey(name: 'for_positions') List<MPosition> forPositions,
    @Default([]) @JsonKey(name: 'for_departments') List<MDepartment> forDepartments,
    @Default(false) @JsonKey(name: 'view_basic_salary') bool viewBasicSalary,
    @Default(false) @JsonKey(name: 'view_current_earning') bool viewCurrentEarning,
    @Default(false) @JsonKey(name: 'view_current_deduction') bool viewCurrentDeduction,
    @Default(false) @JsonKey(name: 'view_resources') bool viewResources,
    @Default(false) @JsonKey(name: 'view_comment') bool viewComment,
    @Default(false) @JsonKey(name: 'write_comment') bool writeComment,
    @Default(false) @JsonKey(name: 'view_performance_point') bool viewPerformancePoint,
    @Default(false) @JsonKey(name: 'pay_performance_point') bool payPerformancePoint,
    @Default(false) bool payrise,
    @Default(false) bool resign,
    @Default(false) bool history,
    @Default(false) bool permission,
    @Default(false) bool add,
  }) = _MColleaguePermission;

  factory MColleaguePermission.fromJson(Map<String, dynamic> json) => _$MColleaguePermissionFromJson(json);
}
