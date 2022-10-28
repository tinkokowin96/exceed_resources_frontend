import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_m_model.freezed.dart';
part 'employee_m_model.g.dart';

@freezed
class MEmployeeM with _$MEmployeeM {
  factory MEmployeeM({
    required String id,
    required String name,
    required String image,
  }) = _MEmployeeM;

  factory MEmployeeM.fromJson(Map<String, dynamic> json) => _$MEmployeeMFromJson(json);
}
