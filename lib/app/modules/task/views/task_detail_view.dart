import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_comments.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/comment_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/status_priority_dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_collaborators.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_section.dart';
import 'package:exceed_resources_frontend/app/routes/task_routes.dart';
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
      containerAction: () => controller.messageFocus.unfocus(),
      content: Padding(
        padding: const EdgeInsets.only(top: AppSize.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbsorbPointer(
                absorbing: controller.messageHasFoucus.value,
                child: AppColumn(
                  spacing: AppSize.md,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskCollaborators(
                      collaborators: controller.task.collaborators,
                      assignedBy: controller.task.assignedBy!,
                    ),
                    DetailSection(title: 'Project', detailText: controller.task.project!.name),
                    DetailSection(title: 'Due Date', detailText: controller.task.dueDate!.formatDate()),
                    AppRow(
                      spacing: AppSize.lg,
                      children: [
                        DetailSection(
                          title: 'Status',
                          detailWidget: StatusPriorityDropdown(
                            statuses: controller.statuses.value,
                            initialStatus: controller.task.status,
                          ),
                        ),
                        DetailSection(
                          title: 'Priority',
                          detailWidget: StatusPriorityDropdown(
                            priorities: controller.priorities.value,
                            initialPriority: controller.task.priority,
                          ),
                        ),
                      ],
                    ),
                    DetailSection(
                      title: 'Description',
                      direction: Axis.vertical,
                      detailPadding: const EdgeInsets.only(top: AppSize.xs),
                      detailWidget: Text(
                        controller.task.description,
                        style: AppTheme.text(context: context),
                      ),
                    ),
                    DetailAttachment(
                      attachments: controller.attachments.value,
                      controller: controller,
                      homeRoute: TaskRoutes.taskDetail,
                    ),
                    Divider(color: AppTheme.of(context).color.idle),
                    DetailComments(
                      controller: controller,
                      comments: controller.task.comments,
                      allComments: controller.getAllCommentsWidget(controller.task.comments, context, true),
                    )
                  ],
                ),
              ),
              Obx(
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
            ],
          ),
        ),
      ),
    );
  }
}
