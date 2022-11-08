import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority.dart';
import 'package:exceed_resources_frontend/app/routes/task_routes.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/project.dart' as mpj;
import 'package:exceed_resources_frontend/app/modules/core/mock/task.dart' as mt;
import 'package:exceed_resources_frontend/app/modules/core/mock/status.dart' as ms;
import 'package:exceed_resources_frontend/app/modules/core/mock/priority.dart' as mp;
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTableController extends AppController {
  final statusController = TextEditingController();
  final columns = ['Task Name', 'Priority', 'Due Date', 'Project'];
  final projects = Rx<List<MProject>>(mpj.projects);
  final tasks = Rx<List<MTask>>(mt.tasks);
  final statuses = Rx<List<MStatus>>(ms.statuses);
  final priorities = Rx<List<MPriority>>(mp.priorities);
  late final selectedTask = Rx<MTask>(tasks.value[0]);
  late List<MTask> allTasks = tasks.value;

  Map<String, List<Widget>> transformRows({
    required BuildContext context,
    required List<dynamic> taskList,
  }) {
    final Map<String, List<Widget>> rowList = {};

    for (final each in taskList) {
      rowList[each.id] = [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextButton(
                onPressed: () {
                  selectedTask.value = each;
                  Get.toNamed(TaskRoutes.taskDetail);
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    AppTheme.of(context).color.secondary.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  each.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(context: context, size: EText.h4, type: ETextType.primary),
                ),
              ),
            ),
            StatusPriority(option: each.status),
          ],
        ),
        StatusPriority(option: each.priority),
        Text(
          (each.dueDate as DateTime).formatDate(),
          style: AppTheme.text(context: context, size: EText.h4),
        ),
        Text(
          each.project.name,
          overflow: TextOverflow.ellipsis,
          style: AppTheme.text(context: context, size: EText.h4),
        ),
      ];
    }
    return rowList;
  }

  void filterTask(MProject project) {
    tasks.value = List.from(allTasks.where((each) => each.project.id == project.id));
    update();
  }

  void resetTasks() {
    tasks.value = allTasks;
    update();
  }
}
