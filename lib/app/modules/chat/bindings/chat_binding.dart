import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_conversation_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/controllers/create_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<ChatGroupController>(() => ChatGroupController(), tag: EChat.projects.name);
    Get.lazyPut<ChatGroupController>(() => ChatGroupController(), tag: EChat.departments.name);
    Get.lazyPut<ChatGroupController>(() => ChatGroupController(), tag: EChat.groups.name);
    Get.lazyPut<ChatGroupController>(() => ChatGroupController(), tag: EChat.colleagues.name);
    Get.lazyPut<CreateGroupController>(() => CreateGroupController());
    Get.lazyPut<ChatConversationController>(() => ChatConversationController());
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
  }
}
