import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_point_model.freezed.dart';
part 'pay_point_model.g.dart';

@freezed
class MPayPoint with _$MPayPoint {
  factory MPayPoint({
    @Default('') String id,
    @Default(0) int amount,
    @JsonKey(name: "pay_point_by") MColleague? payPointBy,
    @JsonKey(name: "pay_point_to") MColleague? payPointTo,
    @JsonKey(name: 'pay_point_type') @Default('manual') String payPointType, // name if payPoint with config
    @Default('') String reason,
  }) = _MPayPoint;

  factory MPayPoint.fromJson(Map<String, dynamic> json) => _$MPayPointFromJson(json);
}
