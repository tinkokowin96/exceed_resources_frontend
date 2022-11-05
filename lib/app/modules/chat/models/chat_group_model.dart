import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_group_model.freezed.dart';
part 'chat_group_model.g.dart';

@freezed
class MChatGroup with _$MChatGroup {
  factory MChatGroup({
    String? id,
    required EChat type,
    @JsonKey(name: 'chat_conversations') required List<MChatConversationM> chatConversations,
  }) = _MChatGroup;

  factory MChatGroup.fromJson(Map<String, dynamic> json) => _$MChatGroupFromJson(json);
}
