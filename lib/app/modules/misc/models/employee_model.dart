import 'package:exceed_resources_frontend/app/modules/misc/models/bank_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class MEmployee with _$MEmployee {
  factory MEmployee({
    required String id,
    required String name,
    required String image,
    required MPosition position,
    @JsonKey(name: 'basic_salary') double? basicSalary,
    List<String>? resources,
    MBank? bank,
    String? remark,
    @Default([]) @JsonKey(name: 'commented_by') List<MEmployeeComment> commentedBy,
    @Default([]) @JsonKey(name: 'commented_to') List<MEmployeeComment> commentedTo,
  }) = _MEmployee;

  factory MEmployee.fromJson(Map<String, dynamic> json) => _$MEmployeeFromJson(json);
}
