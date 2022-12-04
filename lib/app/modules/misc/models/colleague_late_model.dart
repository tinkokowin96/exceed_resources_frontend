import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_late_model.freezed.dart';
part 'colleague_late_model.g.dart';

@freezed
class MColleagueLate with _$MColleagueLate {
  factory MColleagueLate({
    @Default('') String id,
    MColleague? colleague,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    @JsonKey(name: 'start_time', fromJson: dateFromJson, toJson: dateToJson) DateTime? startTime,
    @JsonKey(name: 'end_time', fromJson: dateFromJson, toJson: dateToJson) DateTime? endTime,
    @JsonKey(name: 'allowed_by') MColleague? allowedBy,
  }) = _MColleagueLate;

  factory MColleagueLate.fromJson(Map<String, dynamic> json) => _$MColleagueLateFromJson(json);
}
