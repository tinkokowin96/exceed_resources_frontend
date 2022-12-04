import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_task_model.freezed.dart';
part 'colleague_task_model.g.dart';

@freezed
class MPosition with _$MPosition {
  factory MPosition({
    @Default('') String id,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
    @JsonKey(name: 'approved_by') MColleague? approvedBy,
  }) = _MPosition;

  factory MPosition.fromJson(Map<String, dynamic> json) => _$MPositionFromJson(json);
}
