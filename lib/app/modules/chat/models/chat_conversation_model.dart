import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_model.freezed.dart';
part 'chat_conversation_model.g.dart';

@freezed
class MChatConversation with _$MChatConversation {
  factory MChatConversation({
    @Default('') String id,
    @Default('') String image,
    @Default('') String name,
    @Default(0) @JsonKey(name: 'num_colleague') int numColleague,
    @JsonKey(name: 'chat_messages') Map<String, List<MChatMessage>>? chatMessages,
  }) = _MChatConversation;

  factory MChatConversation.fromJson(Map<String, dynamic> json) => _$MChatConversationFromJson(json);
}
