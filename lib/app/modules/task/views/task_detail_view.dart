import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority_dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_all_comments.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_attachments.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_comment.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailController>(
      builder: (_) {
        return AppLayout.core(
          currentMenu: EMenu.task,
          loading: _.loading.value,
          title: _.task!.name,
          drawer: _.drawer.value,
          controller: controller,
          content: _.task == null
              ? AppSizeBox.zero
              : Padding(
                  padding: const EdgeInsets.only(top: AppSize.lg),
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => controller.messageFocus.unfocus(),
                              child: AbsorbPointer(
                                absorbing: _.messageHasFoucus.value,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Collaborators',
                                              style: AppTheme.text(
                                                context: context,
                                                weight: FontWeight.w500,
                                                type: ETextType.subtitle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: AppSize.sm),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(maxWidth: constraint.maxWidth / 2),
                                                child: Wrap(
                                                  spacing: AppSize.sm,
                                                  runSpacing: AppSize.xs,
                                                  children: List.from(
                                                    _.task!.collaborators.map(
                                                      (each) => TaskCollaborator(
                                                        collaborator: each,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Assigned By',
                                              style: AppTheme.text(
                                                context: context,
                                                weight: FontWeight.w500,
                                                type: ETextType.subtitle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: AppSize.sm),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(maxWidth: constraint.maxWidth / 2),
                                                child: TaskCollaborator(
                                                  collaborator: _.task!.assignedBy,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Project',
                                            style: AppTheme.text(
                                              context: context,
                                              type: ETextType.subtitle,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: AppSize.md),
                                            child: Text(
                                              _.task!.project.name,
                                              style: AppTheme.text(context: context, type: ETextType.primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Due Date',
                                            style: AppTheme.text(
                                              context: context,
                                              type: ETextType.subtitle,
                                              weight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: AppSize.md),
                                            child: Text(
                                              _.task!.dueDate.formatDate(),
                                              style: AppTheme.text(context: context, type: ETextType.primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'MStatus',
                                                style: AppTheme.text(
                                                  context: context,
                                                  weight: FontWeight.w500,
                                                  type: ETextType.subtitle,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: AppSize.md),
                                                child: StatusPriorityDropdown(
                                                  statuses: _.statuses.value,
                                                  initialStatus: _.task!.status,
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: AppSize.lg),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'MPriority',
                                                  style: AppTheme.text(
                                                    context: context,
                                                    weight: FontWeight.w500,
                                                    type: ETextType.subtitle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: AppSize.md),
                                                  child: StatusPriorityDropdown(
                                                    priorities: _.priorities.value,
                                                    initialPriority: _.task!.priority,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Description',
                                            style: AppTheme.text(
                                                context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: AppSize.xs),
                                            child: Text(
                                              _.task!.description,
                                              style: AppTheme.text(context: context),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Attachments',
                                                style: AppTheme.text(
                                                  context: context,
                                                  weight: FontWeight.w500,
                                                  type: ETextType.subtitle,
                                                ),
                                              ),
                                              AppTextButton(
                                                onPressed: () => download(
                                                  controller: controller,
                                                  attachments: controller.attachments.value,
                                                  context: context,
                                                ),
                                                text: 'Download',
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: AppSize.sm),
                                            child: TaskAttachments(
                                              attachments: controller.attachments.value,
                                              width: constraint.maxWidth,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: Divider(
                                        color: AppTheme.of(context).color.idle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.sm),
                                      child: Text(
                                        'Comments',
                                        style: AppTheme.text(
                                          context: context,
                                          weight: FontWeight.w500,
                                          type: ETextType.subtitle,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.sm),
                                      child: TaskComment(
                                        comment: controller.task!.comments[0],
                                        divider: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: InkWell(
                                        onTap: () => controller.showDrawer(
                                          widget: TaskAllComments(comments: controller.task!.comments),
                                        ),
                                        child: Text(
                                          'See all ${controller.task!.comments.length} comments',
                                          style: AppTheme.text(
                                            context: context,
                                            type: ETextType.subtitle,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                              child: Obx(
                                () {
                                  return MessageInput(
                                    width: constraint.maxWidth,
                                    focus: controller.messageFocus,
                                    onFocusChange: controller.onMessageFocusChange,
                                    controller: controller.messageController,
                                    sendMessage: controller.onSendMessage,
                                    listenMessage: controller.listenMessage,
                                    updateAttachment: controller.updateMessageAttachment,
                                    attachments: controller.messageAttachments.value,
                                    colleagueOptions: controller.colleagueOptions,
                                    dropdown: controller.colleagueDropdown.value,
                                    onDropdownChange: controller.onColleagueDropdownChange,
                                    messageText: controller.messageText.value,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
