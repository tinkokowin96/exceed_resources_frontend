import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat/chat_group_expand.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_switcher.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
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
        ...controller.chatGroups.value.map((each) {
          final groupController = Get.find<ChatGroupController>(tag: each.type.name);
          return LayoutBuilder(
            builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            each.type.name.firstCapitalize(),
                            style: AppTheme.text(
                              context: context,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => AppAnimatedSwitcher(
                              child: groupController.expandable.value == EExpandable.expand &&
                                      (each.type == EChat.groups || each.type == EChat.colleagues)
                                  ? AppButton(
                                      onPressed: () {
                                        if (each.type == EChat.groups) {
                                          Get.toNamed(ChatRoutes.createGroup);
                                        }
                                      },
                                      size: const Size(AppSize.btnWSm, AppSize.btnHMd),
                                      text: each.type == EChat.groups ? 'Create' : 'New',
                                    )
                                  : AppSizeBox.zero,
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => AppAnimatedSwitcher(
                        child: groupController.expandable.value == EExpandable.minimize
                            ? AppSizeBox.zero
                            : ChatGroupExpand(
                                conversations: each.chatConversations,
                                width: constraint.maxWidth * 0.4,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: GestureDetector(
                        onTap: groupController.toggleExpandable,
                        child: Obx(
                          () => Icon(
                            groupController.expandable.value == EExpandable.expand
                                ? Icons.expand_more
                                : Icons.expand_less,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: AppTheme.of(context).color.idle,
                    )
                  ],
                ),
              );
            },
          );
        }),
      ]),
    );
  }
}
