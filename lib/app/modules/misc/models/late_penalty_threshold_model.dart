import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/extra_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'late_penalty_threshold_model.freezed.dart';
part 'late_penalty_threshold_model.g.dart';

@freezed
class MLatePenaltyThreshold with _$MLatePenaltyThreshold {
  factory MLatePenaltyThreshold({
    @Default('') String id,
    @Default(0) int minute,
    MExtra? penalty,
  }) = _MLatePenaltyThreshold;

  factory MLatePenaltyThreshold.fromJson(Map<String, dynamic> json) => _$MLatePenaltyThresholdFromJson(json);
}
