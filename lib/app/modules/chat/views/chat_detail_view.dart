import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/message_overview.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      controller: controller,
      headerAction: () => controller.findFocus.unfocus(),
      content: AppColumn(
        spacing: AppSize.md,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSize.sm),
            child: AppCircle.image(size: AppSize.cXl, image: controller.chatDetail.value.image),
          ),
          Text(
            controller.chatDetail.value.name,
            style: AppTheme.text(
              context: context,
              size: EText.h2,
              weight: FontWeight.w500,
            ),
          ),
          AppContainer(
            width: App.width(context) * 0.8,
            child: Text(
              controller.chatDetail.value.description,
              style: AppTheme.text(context: context),
            ),
          ),
          TextField(
            focusNode: controller.findFocus,
            decoration: AppThemeMiscs.inputStyle(
              context: context,
              hintText: 'Find Message',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.md),
              child: Column(
                children: [
                  Obx(
                    () => Expandable(
                      name: 'Colleagues',
                      toggleExpand: controller.toggleExpandable,
                      heading: AppSizeBox.zero,
                      expand: controller.colleagueExpandable.value == EExpandable.expand,
                      content: controller.colleagueExpandable.value == EExpandable.expand
                          ? ListView(
                              key: const ValueKey('colleague_expend'),
                              children: List.from(
                                controller.chatDetail.value.colleagues.map(
                                  (colleague) => MessageOverview(
                                    image: colleague.image,
                                    name: colleague.name,
                                    description: colleague.positionName,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(key: ValueKey('colleague_minimize'), width: 0, height: 0),
                    ),
                  ),
                  if (controller.chatDetail.value.attachments.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: AppColumn(
                        spacing: AppSize.sm,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Resources',
                                style: AppTheme.text(
                                  context: context,
                                  weight: FontWeight.w500,
                                  type: ETextType.subtitle,
                                ),
                              ),
                              AppTextButton(text: 'Download', onPressed: () {}),
                            ],
                          ),
                          Divider(color: AppTheme.of(context).color.idle)
                        ],
                      ),
                    ),
                  Obx(
                    () => Expandable(
                      name: 'Pinned Messages',
                      toggleExpand: () => controller.toggleExpandable(colleague: false),
                      heading: AppSizeBox.zero,
                      expand: controller.pinExpandable.value == EExpandable.expand,
                      content: controller.pinExpandable.value == EExpandable.expand
                          ? ListView(
                              key: const ValueKey('pin_expend'),
                              children: List.from(
                                controller.chatDetail.value.pinMessages.map(
                                  (message) => MessageOverview(
                                    image: message.colleague!.image,
                                    name: message.colleague!.name,
                                    description: message.colleague!.positionName,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(key: ValueKey('pin_minimize'), width: 0, height: 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
