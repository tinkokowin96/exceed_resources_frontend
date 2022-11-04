import 'package:exceed_resources_frontend/app/modules/misc/models/bank_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_model.freezed.dart';
part 'colleague_model.g.dart';

@freezed
class MColleague with _$MColleague {
  factory MColleague({
    required String id,
    required String name,
    required String image,
    required MPosition position,
    @JsonKey(name: 'basic_salary') double? basicSalary,
    @Default([]) @JsonKey(name: 'commented_by') List<MColleagueComment> commentedBy,
    @Default([]) @JsonKey(name: 'commented_to') List<MColleagueComment> commentedTo,
    ColleagueStatusM? status,
    List<String>? resources,
    MBank? bank,
    String? remark,
  }) = _MColleague;

  factory MColleague.fromJson(Map<String, dynamic> json) => _$MColleagueFromJson(json);
}
