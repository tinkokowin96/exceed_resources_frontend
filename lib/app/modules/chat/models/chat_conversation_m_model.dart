import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation_m_model.freezed.dart';
part 'chat_conversation_m_model.g.dart';

@freezed
class MChatConversationM with _$MChatConversationM {
  factory MChatConversationM({
    @Default('') String id,
    @Default('') String image,
    @Default('') String name,
    @Default(0) @JsonKey(name: 'num_unread') int numUnread,
    @Default('') @JsonKey(name: 'last_message') String lastMessage,
  }) = _MChatConversationM;

  factory MChatConversationM.fromJson(Map<String, dynamic> json) => _$MChatConversationMFromJson(json);
}
