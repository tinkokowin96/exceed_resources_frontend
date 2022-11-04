import 'package:exceed_resources_frontend/app/modules/chat/models/chat_call_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class MChatMessage with _$MChatMessage {
  factory MChatMessage({
    String? id,
    required MColleagueM colleague,
    List<MAttachment>? chat_attachments,
    String? chat_text,
    MChatCall? chat_call,
    @JsonKey(
      name: 'updated_at',
      fromJson: dateFromJson,
    )
        DateTime? updatedAt,
  }) = _MChatMessage;

  factory MChatMessage.fromJson(Map<String, dynamic> json) => _$MChatMessageFromJson(json);
}
