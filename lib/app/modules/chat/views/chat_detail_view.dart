import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      controller: controller,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.md),
            child: AppCircle.image(size: AppSize.cXl, image: controller.chatDetail.value.image),
          ),
          AppContainer(
            child: Text(
              controller.chatDetail.value.description,
              style: AppTheme.text(context: context),
            ),
          )
        ],
      ),
    );
  }
}
