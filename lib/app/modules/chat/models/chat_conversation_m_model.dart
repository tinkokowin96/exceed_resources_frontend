import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_m_model.freezed.dart';
part 'chat_conversation_m_model.g.dart';

@freezed
class MChatConversationM with _$MChatConversationM {
  factory MChatConversationM({
    String? id,
    required String image,
    required String name,
    @JsonKey(name: 'num_unread') required int numUnread,
    @JsonKey(name: 'last_message') required String lastMessage,
  }) = _MChatConversationM;

  factory MChatConversationM.fromJson(Map<String, dynamic> json) => _$MChatConversationMFromJson(json);
}
