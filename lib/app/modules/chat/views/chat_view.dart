import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      currentMenu: EMenu.chat,
      content: Container(color: Colors.blueGrey),
      noHeader: false,
    );
  }
}
