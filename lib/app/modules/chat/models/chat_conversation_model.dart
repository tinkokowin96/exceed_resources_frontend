import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_model.freezed.dart';
part 'chat_conversation_model.g.dart';

@freezed
class MChatConversation with _$MChatConversation {
  factory MChatConversation({
    required String image,
    required String name,
    @JsonKey(name: 'num_colleague') required int numColleague,
    @JsonKey(name: 'chat_messages') required Map<String, List<MChatMessage>> chatMessages,
    @JsonKey(name: 'chat_detail') required MChatDetail chatDetail,
  }) = _MChatConversation;

  factory MChatConversation.fromJson(Map<String, dynamic> json) => _$MChatConversationFromJson(json);
}
