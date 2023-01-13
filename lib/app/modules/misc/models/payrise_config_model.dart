import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payrise_config_model.freezed.dart';
part 'payrise_config_model.g.dart';

@freezed
class MPayriseConfig with _$MPayriseConfig {
  factory MPayriseConfig({
    @Default('') String id,
    @Default('') String name,
    @Default(0) int amount,
    @Default(0) @JsonKey(name: 'threshold_amount') int thresholdAmount,
    @JsonKey(name: 'effective_date', fromJson: dateFromJson, toJson: dateToJson) DateTime? effectiveDate,
    @Default(false) @JsonKey(name: 'rise_over_tenure') bool riseOverTenure,
    @Default(true) @JsonKey(name: 'rise_absolute') bool riseAbsolute,
    @Default(true) bool active,
    @Default('') String remark,
  }) = _MPayriseConfig;

  factory MPayriseConfig.fromJson(Map<String, dynamic> json) => _$MPayriseConfigFromJson(json);
}
