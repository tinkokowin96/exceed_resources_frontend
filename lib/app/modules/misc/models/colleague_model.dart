import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/bank_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/leave_allowance_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
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
    @Default(false) @JsonKey(name: 'top_management') bool topManagement,
    @Default([]) @JsonKey(name: 'department_executive') List<bool> departmentExecutive,
    @Default([]) @JsonKey(name: 'commented_by') List<MColleagueComment> commentedBy,
    @Default([]) @JsonKey(name: 'commented_to') List<MColleagueComment> commentedTo,
    @Default([]) @JsonKey(name: 'current_month_earning') List<MReportCategory> currentMonthEarning,
    @Default(0) @JsonKey(name: 'total_current_month_earning') double totalCurrentMonthEarning,
    @Default([]) @JsonKey(name: 'current_month_deduction') List<MReportCategory> currentMonthDeduction,
    @Default(0) @JsonKey(name: 'total_current_month_deduction') double totalCurrentMonthDeduction,
    @Default([]) List<MLeaveAllowance> leaves,
    @Default([]) List<MAttachment> resources,
    @Default([]) List<MComment> reviews,
    @JsonKey(name: 'earning_history') Map<String, List<MReportCategory>>? earningHistory,
    @JsonKey(name: 'deduction_history') Map<String, List<MReportCategory>>? deductionHistory,
    ColleagueStatusM? status,
    MBank? bank,
    @Default('') String remark,
  }) = _MColleague;

  factory MColleague.fromJson(Map<String, dynamic> json) => _$MColleagueFromJson(json);
}
