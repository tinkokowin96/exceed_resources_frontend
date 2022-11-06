import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_conversation_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_date.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_header.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatConversationView extends GetView<ChatConversationController> {
  const ChatConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatConversationController>(
      builder: (_) {
        return AppLayout.core(
          currentMenu: EMenu.chat,
          loading: _.loading.value,
          content: Column(
            children: [
              ConversationHeader(
                image: controller.conversation.value!.image,
                name: controller.conversation.value!.name,
                numColleague: controller.conversation.value!.numColleague,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.from(
                  controller.conversation.value!.chatMessages.entries.map(
                    (each) => Padding(
                      padding: const EdgeInsets.only(top: AppSize.md),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConversationDate(date: each.key),
                          ConversationMessage(messages: each.value),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
