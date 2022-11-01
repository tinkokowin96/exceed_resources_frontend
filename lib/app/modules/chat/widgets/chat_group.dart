import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_group_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/unread_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatGroup extends StatelessWidget {
  final MChatGroup chatGroup;

  const ChatGroup({
    Key? key,
    required this.chatGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatGroupController>(tag: chatGroup.type.name);
    return LayoutBuilder(builder: (context, constraint) {
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
                    chatGroup.type.name.firstCapitalize(),
                    style: AppTheme.text(
                      context: context,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(
                        onPressed: () {},
                        size: const Size(AppSize.btnWSm, AppSize.btnHMd),
                        text: 'All',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.sm),
                        child: Stack(
                          children: [
                            AppButton(
                              onPressed: () {},
                              size: const Size(AppSize.btnWSm, AppSize.btnHMd),
                              text: 'Unread',
                            ),
                            UnreadMessage(
                              numUnread:
                                  chatGroup.chatConversations.fold(0, (value, element) => value + element.numUnread),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1.2, 0), end: const Offset(0, 0)).animate(animation),
                  child: child,
                ),
                child: controller.expendable.value == EExpandable.minimize
                    ? AppSizeBox.zero
                    : ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.from(
                              chatGroup.chatConversations.map(
                                (each) => Padding(
                                  padding: const EdgeInsets.only(top: AppSize.md),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: constraint.maxWidth * 0.4,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: AppSize.conimg,
                                              height: AppSize.conimg,
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(AppSize.conimg / 2),
                                                    child: CachedNetworkImage(
                                                      imageUrl: each.image,
                                                      width: AppSize.conimg,
                                                      height: AppSize.conimg,
                                                    ),
                                                  ),
                                                  each.numUnread > 0
                                                      ? UnreadMessage(numUnread: each.numUnread)
                                                      : AppSizeBox.zero,
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: AppSize.sm,
                                                ),
                                                child: Text(
                                                  each.name,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppTheme.text(context: context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          each.lastMessage,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTheme.text(context: context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: GestureDetector(
                onTap: controller.toggleExpendable,
                child: Obx(() {
                  return Icon(
                    controller.expendable.value == EExpandable.expand ? Icons.expand_more : Icons.expand_less,
                  );
                }),
              ),
            ),
            Divider(
              color: AppTheme.of(context).color.idle,
            )
          ],
        ),
      );
    });
  }
}
