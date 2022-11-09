import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_conversation_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_date.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_header.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat%20conversation/conversation_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatConversationView extends GetView<ChatConversationController> {
  const ChatConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      controller: controller,
      content: LayoutBuilder(builder: (context, constraint) {
        return Column(
          children: [
            ConversationHeader(
              image: controller.conversation.value!.image,
              name: controller.conversation.value!.name,
              numColleague: controller.conversation.value!.numColleague,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                child: ListView.builder(
                  controller: controller.scrollController,
                  reverse: true,
                  itemCount: controller.conversation.value!.chatMessages.entries.length,
                  itemBuilder: (context, index) {
                    final item = List.from(controller.conversation.value!.chatMessages.entries)[index];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConversationDate(date: item.key),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.from(
                                item.value.map((each) => ConversationMessage(message: each)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.md),
              child: Obx(
                () {
                  return MessageInput(
                    width: constraint.maxWidth,
                    sendMessage: controller.onSendMessage,
                    updateAttachment: controller.updateMessageAttachment,
                    attachments: controller.messageAttachments.value,
                    input: LayoutBuilder(
                      builder: (context, inputConstraint) {
                        return SizedBox(
                          width: inputConstraint.maxWidth,
                          child: TextField(
                            controller: controller.messageController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: AppTheme.text(context: context),
                            decoration: AppThemeMiscs.inputStyle(
                              context: context,
                              color: EInputColor.background,
                              border: EInputColor.background,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
