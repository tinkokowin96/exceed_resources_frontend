import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payrise_model.freezed.dart';
part 'payrise_model.g.dart';

@freezed
class MPayrise with _$MPayrise {
  factory MPayrise({
    @Default('') String id,
    @Default(0) int amount,
    @JsonKey(name: "payrise_by") MColleague? payriseBy,
    @JsonKey(name: "payrise_to") MColleague? payriseTo,
    @JsonKey(name: 'payrise_type') @Default('manual') String payriseType, // name if payrise with config
    @Default('') String reason,
  }) = _MPayrise;

  factory MPayrise.fromJson(Map<String, dynamic> json) => _$MPayriseFromJson(json);
}
