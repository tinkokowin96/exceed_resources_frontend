import 'package:exceed_resources_frontend/app/modules/misc/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';
part 'position.g.dart';

@freezed
class Position with _$Position {
  factory Position({
    required String id,
    required String name,
    @JsonKey(name: 'basic_salary') double? basicSalary,
    String? remark,
    @Default([]) List<Employee> employees,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
}
