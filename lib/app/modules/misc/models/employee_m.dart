import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_m.freezed.dart';
part 'employee_m.g.dart';

@freezed
class EmployeeM with _$EmployeeM {
  factory EmployeeM({
    required String id,
    required String name,
  }) = _EmployeeM;

  factory EmployeeM.fromJson(Map<String, dynamic> json) => _$EmployeeMFromJson(json);
}
