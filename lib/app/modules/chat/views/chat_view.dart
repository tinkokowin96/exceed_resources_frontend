import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat_group.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      content: ListView(children: [
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
        ...controller.chatGroups.map(
          (each) => ChatGroup(chatGroup: each),
        ),
      ]),
    );
  }
}
