import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_call_model.freezed.dart';
part 'chat_call_model.g.dart';

@freezed
class MChatCall with _$MChatCall {
  factory MChatCall({
    String? id,
    required List<MEmployeeM> colleagues,
    required int duration,
    @JsonKey(
      name: 'created_at',
      fromJson: dateFromJson,
    )
        DateTime? createdAt,
  }) = _MChatCall;

  factory MChatCall.fromJson(Map<String, dynamic> json) => _$MChatCallFromJson(json);
}
