import 'package:exceed_resources_frontend/app/modules/chat/models/chat_group_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/chat_conversation.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';

final chatGroups = [
  MChatGroup(type: EChat.projects, chatConversations: chatConversations),
  MChatGroup(type: EChat.departments, chatConversations: chatConversations),
  MChatGroup(type: EChat.groups, chatConversations: chatConversations),
  MChatGroup(type: EChat.colleagues, chatConversations: chatConversations),
];
