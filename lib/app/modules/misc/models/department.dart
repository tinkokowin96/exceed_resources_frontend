import 'package:exceed_resources_frontend/app/modules/core/models/permission.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.freezed.dart';
part 'department.g.dart';

@freezed
class Department with _$Department {
  factory Department({
    required String id,
    required String name,
    @Default([]) List<Employee> employees,
    @Default([]) List<Permission> permissions,
    List<String>? resources,
    String? remark,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}
