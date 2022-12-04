import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/overtime_form_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_overtime_model.freezed.dart';
part 'colleague_overtime_model.g.dart';

@freezed
class MColleagueOvertime with _$MColleagueOvertime {
  factory MColleagueOvertime({
    @Default('') String id,
    MColleague? colleague,
    MOvertimeForm? overtime,
    @JsonKey(name: 'allowed_by') MColleague? allowedBy,
  }) = _MColleagueOvertime;

  factory MColleagueOvertime.fromJson(Map<String, dynamic> json) => _$MColleagueOvertimeFromJson(json);
}
