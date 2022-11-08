import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';

final chatConversations = [
  MChatConversationM(
    image: asset_data[0],
    name: 'Myanmar Forward Enterprise',
    numUnread: 13,
    lastMessage:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
  ),
  MChatConversationM(
    image: asset_data[1],
    name: 'EPOS',
    numUnread: 0,
    lastMessage:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
  ),
  MChatConversationM(
    image: asset_data[0],
    name: 'New Life Myanmar',
    numUnread: 5,
    lastMessage:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
  ),
  MChatConversationM(
    image: asset_data[2],
    name: 'True Shop',
    numUnread: 0,
    lastMessage:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
  ),
];
