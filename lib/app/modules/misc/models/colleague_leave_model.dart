import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/leave_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_leave_model.freezed.dart';
part 'colleague_leave_model.g.dart';

@freezed
class MColleagueLeave with _$MColleagueLeave {
  factory MColleagueLeave({
    @Default('') String id,
    @JsonKey(name: 'allowed_by') MColleague? allowedBy,
    MColleague? colleague,
    MLeave? leave,
  }) = _MColleagueLeave;

  factory MColleagueLeave.fromJson(Map<String, dynamic> json) => _$MColleagueLeaveFromJson(json);
}
