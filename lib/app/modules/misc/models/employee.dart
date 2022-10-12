import 'package:exceed_resources_frontend/app/modules/misc/models/bank.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_comment.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  factory Employee({
    required String id,
    required String name,
    required String image,
    required Position position,
    @JsonKey(name: 'basic_salary') double? basicSalary,
    List<String>? resources,
    Bank? bank,
    String? remark,
    @Default([]) @JsonKey(name: 'commented_by') List<EmployeeComment> commentedBy,
    @Default([]) @JsonKey(name: 'commented_to') List<EmployeeComment> commentedTo,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}
