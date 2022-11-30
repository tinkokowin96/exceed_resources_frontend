import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_permission_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_model.freezed.dart';
part 'position_model.g.dart';

@freezed
class MPosition with _$MPosition {
  factory MPosition({
    @Default('') String id,
    @Default('') String name,
    @Default('') @JsonKey(name: 'short_name') String shortName,
    @Default(0) @JsonKey(name: 'basic_salary') double basicSalary,
    @Default([]) List<MColleague> colleagues,
    @Default([]) List<EPermission> permissions,
    MColleaguePermission? colleaguePermission,
    @Default('') String remark,
  }) = _MPosition;

  factory MPosition.fromJson(Map<String, dynamic> json) => _$MPositionFromJson(json);
}
