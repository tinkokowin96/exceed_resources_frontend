import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/comment_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/status_priority_dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_all_comments.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_attachments.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_collaborators.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_comment.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_detail_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailView extends GetView<TaskDetailController> {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.task,
      title: controller.task.name,
      controller: controller,
      content: Padding(
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
                      absorbing: controller.messageHasFoucus.value,
                      child: AppColumn(
                        spacing: AppSize.md,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TaskCollaborators(
                            collaborators: controller.task.collaborators,
                            assignedBy: controller.task.assignedBy,
                            width: constraint.maxWidth,
                          ),
                          TaskDetailSection(title: 'Project', detailText: controller.task.project.name),
                          TaskDetailSection(title: 'Due Date', detailText: controller.task.dueDate.formatDate()),
                          AppRow(
                            spacing: AppSize.lg,
                            children: [
                              TaskDetailSection(
                                title: 'Status',
                                detailWidget: StatusPriorityDropdown(
                                  statuses: controller.statuses.value,
                                  initialStatus: controller.task.status,
                                ),
                              ),
                              TaskDetailSection(
                                title: 'Priority',
                                detailWidget: StatusPriorityDropdown(
                                  priorities: controller.priorities.value,
                                  initialPriority: controller.task.priority,
                                ),
                              ),
                            ],
                          ),
                          TaskDetailSection(
                            title: 'Description',
                            direction: Axis.vertical,
                            detailPadding: const EdgeInsets.only(top: AppSize.xs),
                            detailWidget: Text(
                              controller.task.description,
                              style: AppTheme.text(context: context),
                            ),
                          ),
                          Column(
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
                          Divider(
                            color: AppTheme.of(context).color.idle,
                          ),
                          Text(
                            'Comments',
                            style: AppTheme.text(
                              context: context,
                              weight: FontWeight.w500,
                              type: ETextType.subtitle,
                            ),
                          ),
                          TaskComment(
                            comment: controller.task.comments[0],
                            divider: false,
                          ),
                          InkWell(
                            onTap: () => controller.showDrawer(
                              widget: TaskAllComments(comments: controller.task.comments),
                            ),
                            child: Text(
                              'See all ${controller.task.comments.length} comments',
                              style: AppTheme.text(
                                context: context,
                                type: ETextType.subtitle,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      return MessageInput(
                        width: constraint.maxWidth,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
