import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_model.freezed.dart';
part 'position_model.g.dart';

@freezed
class MPosition with _$MPosition {
  factory MPosition({
    required String id,
    required String name,
    @JsonKey(name: 'basic_salary') double? basicSalary,
    String? remark,
    @Default([]) List<MColleague> colleagues,
  }) = _MPosition;

  factory MPosition.fromJson(Map<String, dynamic> json) => _$MPositionFromJson(json);
}
