import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_model.freezed.dart';
part 'extra_model.g.dart';

@freezed
class MExtra with _$MExtra {
  factory MExtra({
    @Default(EExtra.salary) @JsonKey(name: 'penalty_type') EExtra penaltyType,
    double? value,
  }) = _MExtra;

  factory MExtra.fromJson(Map<String, dynamic> json) => _$MExtraFromJson(json);
}
