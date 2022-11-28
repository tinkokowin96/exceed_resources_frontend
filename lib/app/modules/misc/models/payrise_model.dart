import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payrise_model.freezed.dart';
part 'payrise_model.g.dart';

@freezed
class MPayrise with _$MPayrise {
  factory MPayrise({
    required String id,
    required String name,
    required int amount,
    @JsonKey(name: 'threshold_amount') required int thresholdAmount,
    @JsonKey(name: 'effective_date', fromJson: dateFromJson, toJson: dateToJson) required DateTime effectiveDate,
    @JsonKey(name: 'rise_over_tenure') @Default(false) bool riseOverTenure,
    @JsonKey(name: 'rise_absolute') @Default(true) bool riseAbsolute,
    @Default(true) bool active,
    String? remark,
  }) = _MPayrise;

  factory MPayrise.fromJson(Map<String, dynamic> json) => _$MPayriseFromJson(json);
}
