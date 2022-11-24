import 'package:exceed_resources_frontend/app/modules/misc/models/bank_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_model.freezed.dart';
part 'colleague_model.g.dart';

//earning/deduction history key is timestamp

@freezed
class MColleague with _$MColleague {
  factory MColleague({
    required String id,
    required String name,
    required String image,
    required MPosition position,
    required String email,
    required String phone,
    @JsonKey(name: 'basic_salary') required double basicSalary,
    @JsonKey(name: 'department_executive') @Default([]) List<bool> departmentExecutive,
    @Default(false) @JsonKey(name: 'top_management') bool topManagement,
    @Default([]) List<MDepartment> departments,
    @Default([]) @JsonKey(name: 'commented_by') List<MColleagueComment> commentedBy,
    @Default([]) @JsonKey(name: 'commented_to') List<MColleagueComment> commentedTo,
    @Default([]) @JsonKey(name: 'current_month_earning') List<MReportCategory> currentMonthEarning,
    @Default([]) @JsonKey(name: 'current_month_deduction') List<MReportCategory> currentMonthDeduction,
    @JsonKey(name: 'earning_history') Map<String, List<MReportCategory>>? earningHistory,
    @JsonKey(name: 'deduction_history') Map<String, List<MReportCategory>>? deductionHistory,
    ColleagueStatusM? status,
    List<String>? resources,
    MBank? bank,
    String? remark,
  }) = _MColleague;

  factory MColleague.fromJson(Map<String, dynamic> json) => _$MColleagueFromJson(json);
}
