import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_attachments.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_collaborator.dart';
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
        return AppLayout(
          currentMenu: EMenu.task,
          loading: _.loading.value,
          title: _.task.value != null ? _.task.value!.name : null,
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
                                  Text(
                                    'Attachments',
                                    style: AppTheme.text(
                                      context: context,
                                      weight: FontWeight.w500,
                                      type: ETextType.subtitle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: AppSize.sm),
                                    child: TaskAttachments(
                                      attachments: controller.attachments,
                                      width: constraint.maxWidth,
                                    ),
                                  ),
                                ],
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
