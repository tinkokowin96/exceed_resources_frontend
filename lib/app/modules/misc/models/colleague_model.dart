import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/bank_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/leave_allowance_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:exceed_resources_frontend/app/modules/salary/models/salary_category_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/review_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_model.freezed.dart';
part 'colleague_model.g.dart';

//earning/deduction history key is timestamp

@freezed
class MColleague with _$MColleague {
  factory MColleague({
    @Default('') String id,
    @Default('') String name,
    @Default('') String image,
    @Default('') String email,
    @Default('') String phone,
    MPosition? position,
    @Default(0) @JsonKey(name: 'basic_salary') double basicSalary,
    @JsonKey(name: 'joining_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? joiningDate,
    @Default([]) List<MDepartment> departments,
    @Default([]) @JsonKey(name: 'current_month_earning') List<MSalaryCategory> currentMonthEarning,
    @Default(0) @JsonKey(name: 'total_current_month_earning') double totalCurrentMonthEarning,
    @Default([]) @JsonKey(name: 'current_month_deduction') List<MSalaryCategory> currentMonthDeduction,
    @Default(0) @JsonKey(name: 'total_current_month_deduction') double totalCurrentMonthDeduction,
    @Default([]) List<MLeaveAllowance> leaves,
    @Default([]) List<MAttachment> attachments,
    @Default([]) List<MReview> reviews,
    @JsonKey(name: 'earning_history') Map<String, List<MSalaryCategory>>? earningHistory,
    @JsonKey(name: 'deduction_history') Map<String, List<MSalaryCategory>>? deductionHistory,
    ColleagueStatusM? status,
    MBank? bank,
    @Default('') String remark,
  }) = _MColleague;

  factory MColleague.fromJson(Map<String, dynamic> json) => _$MColleagueFromJson(json);
}
