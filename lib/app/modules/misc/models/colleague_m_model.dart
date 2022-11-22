import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_m_model.freezed.dart';
part 'colleague_m_model.g.dart';

@freezed
class MColleagueM with _$MColleagueM {
  factory MColleagueM({
    required String id,
    required String name,
    required String image,
    @JsonKey(name: 'position_name') required String positionName,
    double? salary,
    String? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    ColleagueStatusM? status,
  }) = _MColleagueM;

  factory MColleagueM.fromJson(Map<String, dynamic> json) => _$MColleagueMFromJson(json);
}
