import 'package:exceed_resources_frontend/app/modules/misc/models/leave_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_allowance_model.freezed.dart';
part 'leave_allowance_model.g.dart';

@freezed
class MLeaveAllowance with _$MLeaveAllowance {
  factory MLeaveAllowance({
    @Default(0) @JsonKey(name: 'allowed') int allowed,
    MLeave? leave,
  }) = _MLeaveAllowance;

  factory MLeaveAllowance.fromJson(Map<String, dynamic> json) => _$MLeaveAllowanceFromJson(json);
}
