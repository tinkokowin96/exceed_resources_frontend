import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_call_model.freezed.dart';
part 'chat_call_model.g.dart';

@freezed
class MChatCall with _$MChatCall {
  factory MChatCall({
    @Default('') String id,
    @Default([]) List<MColleague> colleagues,
    @Default(0) int duration,
    @JsonKey(name: 'created_at', fromJson: dateFromJson) DateTime? createdAt,
  }) = _MChatCall;

  factory MChatCall.fromJson(Map<String, dynamic> json) => _$MChatCallFromJson(json);
}
