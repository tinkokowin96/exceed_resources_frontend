import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_item.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/expandable.dart';
import 'package:exceed_resources_frontend/app/routes/chat_routes.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      controller: controller,
      content: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Text(
                'Easfinity',
                style: AppTheme.text(
                  context: context,
                  weight: FontWeight.w500,
                  size: EText.h2,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: List.from(
                controller.chatGroups.value.map(
                  (each) {
                    final groupController = Get.find<ChatGroupController>(tag: each.type.name);
                    return Obx(
                      () => Expandable(
                        name: each.type.name.firstCapitalize(),
                        heading: groupController.expandable.value == EExpandable.expand &&
                                (each.type == EChat.groups || each.type == EChat.colleagues)
                            ? AppButton(
                                onPressed: () {
                                  if (each.type == EChat.groups) {
                                    Get.toNamed(ChatRoutes.createGroup);
                                  }
                                },
                                text: each.type == EChat.groups ? 'Create' : 'New',
                              )
                            : AppSizeBox.zero,
                        content: groupController.expandable.value == EExpandable.expand
                            ? ListView(
                                key: ValueKey('${each.type.name}_expand'),
                                children: List.from(
                                  each.chatConversations.map(
                                    (conversation) => ColleagueItem(
                                      image: conversation.image,
                                      name: conversation.name,
                                      numUnread: conversation.numUnread,
                                      description: conversation.lastMessage,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(key: ValueKey('${each.type.name}_minimize'), width: 0, height: 0),
                        expand: groupController.expandable.value == EExpandable.expand,
                        toggleExpand: groupController.toggleExpandable,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
