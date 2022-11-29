import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_comments.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_section.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/timer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/comment_input.dart';
import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ColleagueDetailView extends GetView<ColleagueDetailController> {
  const ColleagueDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: '',
      topPadding: 0,
      containerAction: () => controller.messageFocus.unfocus(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            AppCircle.image(size: AppSize.cXl, image: controller.data.image),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Text(
                controller.data.name,
                style: AppTheme.text(
                  context: context,
                  weight: FontWeight.w500,
                  size: EText.h2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.md),
              child: AppRow(
                spacing: AppSize.md,
                children: [
                  AppAnimatedPress(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/pay_rise.svg'),
                  ),
                  AppAnimatedPress(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/chat.svg'),
                  ),
                  AppAnimatedPress(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/resign.svg'),
                  ),
                  AppAnimatedPress(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/history.svg'),
                  ),
                  AppAnimatedPress(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/icons/permission.svg'),
                  ),
                ],
              ),
            ),
            AbsorbPointer(
              absorbing: controller.messageHasFoucus.value,
              child: Padding(
                padding: const EdgeInsets.only(top: AppSize.lg),
                child: AppColumn(
                  spacing: AppSize.md,
                  children: [
                    DetailSection(
                      title: 'Status',
                      detailWidget: Row(
                        children: [
                          AppCircle.container(width: AppSize.cXxs, color: controller.data.status!.color),
                          Padding(
                            padding: const EdgeInsets.only(left: AppSize.md),
                            child: Text(
                              '${controller.data.status!.name} until - ',
                              style: AppTheme.text(context: context),
                            ),
                          ),
                          AppTimer(until: controller.data.status!.until!, onCompleted: () {})
                        ],
                      ),
                    ),
                    DetailSection(
                      title: 'Position',
                      detailText: controller.data.position.name,
                    ),
                    DetailSection(
                      title: 'Basic Salary',
                      detailText: controller.data.basicSalary.toString(),
                    ),
                    DetailSection(
                      title: 'Current Earning',
                      detailText: controller.data.totalCurrentMonthEarning.toString(),
                    ),
                    DetailSection(
                      title: 'Current Deduction',
                      detailText: controller.data.totalCurrentMonthDeduction.toString(),
                    ),
                    DetailAttachment(
                      title: 'Resources',
                      attachments: controller.data.resources,
                      controller: controller,
                      homeRoute: MiscRoutes.colleagueDetail,
                    ),
                    Divider(color: AppTheme.of(context).color.idle),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: DetailComments(
                        controller: controller,
                        comments: controller.data.reviews,
                        allComments: controller.getAllCommentsWidget(controller.data.reviews, context, false),
                        showLike: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.md),
              child: Obx(
                () {
                  return MessageInput(
                    sendMessage: controller.onSendMessage,
                    updateAttachment: controller.updateMessageAttachment,
                    attachments: controller.messageAttachments.value,
                    input: CommentInput(
                      focus: controller.messageFocus,
                      onFocusChange: controller.onMessageFocusChange,
                      controller: controller.messageController,
                      listenMessage: controller.listenMessage,
                      colleagueOptions: controller.colleagueOptions,
                      dropdown: controller.colleagueDropdown.value,
                      onDropdownChange: controller.onColleagueDropdownChange,
                      messageText: controller.messageText.value,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
