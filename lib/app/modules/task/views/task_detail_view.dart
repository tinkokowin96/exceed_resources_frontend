import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_all_comments.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_attachments.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaskTableController());
    Get.put(TaskDetailController());
    return GetBuilder<TaskDetailController>(
      builder: (_) {
        return AppLayout.core(
          currentMenu: EMenu.task,
          loading: _.loading.value,
          title: _.task.value != null ? _.task.value!.name : null,
          drawer: _.drawer.value,
          controller: controller,
          content: _.task.value == null
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
                                                    _.task.value!.collaborators.map(
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
                                                  collaborator: _.task.value!.assignedBy,
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
                                              _.task.value!.project.name,
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
                                              formatDate(date: _.task.value!.dueDate),
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
                                                'Status',
                                                style: AppTheme.text(
                                                  context: context,
                                                  weight: FontWeight.w500,
                                                  type: ETextType.subtitle,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: AppSize.md),
                                                child: StatusPriorityDropdown(
                                                  statuses: controller.statuses.value,
                                                  initialStatus: _.task.value!.status,
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
                                                  'Priority',
                                                  style: AppTheme.text(
                                                    context: context,
                                                    weight: FontWeight.w500,
                                                    type: ETextType.subtitle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: AppSize.md),
                                                  child: StatusPriorityDropdown(
                                                    priorities: controller.priorities.value,
                                                    initialPriority: _.task.value!.priority,
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
                                              _.task.value!.description,
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
                                        comment: controller.task.value!.comments[0],
                                        divider: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppSize.md),
                                      child: InkWell(
                                        onTap: () => controller.showDrawer(
                                          widget: TaskAllComments(comments: controller.task.value!.comments),
                                        ),
                                        child: Text(
                                          'See all ${controller.task.value!.comments.length} comments',
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
                                    employeeOptions: controller.employeeOptions,
                                    dropdown: controller.employeeDropdown.value,
                                    onDropdownChange: controller.onEmployeeDropdownChange,
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
