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
    MColleagueM? colleague,
    List<MAttachment>? chat_attachments,
    List<String>? chat_text,
    @JsonKey(name: 'chat_call')
        MChatCall? chatCall,
    @JsonKey(
      name: 'created_at',
      fromJson: dateFromJson,
    )
        DateTime? createdAt,
  }) = _MChatMessage;

  factory MChatMessage.fromJson(Map<String, dynamic> json) => _$MChatMessageFromJson(json);
}