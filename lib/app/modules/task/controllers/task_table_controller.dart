import 'dart:convert';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority.dart';
import 'package:exceed_resources_frontend/app/routes/task_routes.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskTableController extends AppController {
  final statusController = TextEditingController();
  final columns = ['Task Name', 'MPriority', 'Due Date', 'MProject'];
  final projects = Rx<List<MProject>>([]);
  final tasks = Rx<List<MTask>>([]);
  final statuses = Rx<List<MStatus>>([]);
  final priorities = Rx<List<MPriority>>([]);
  final selectedTask = Rxn<MTask>();
  List<MTask> allTasks = [];

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

  Future<void> readJsonFile() async {
    stopwatch.start();
    final projectDataString = await rootBundle.loadString('assets/mock/project.json');
    final projectData = jsonDecode(projectDataString);
    final statusDataString = await rootBundle.loadString('assets/mock/status.json');
    final statusData = jsonDecode(statusDataString);
    final priorityDataString = await rootBundle.loadString('assets/mock/priority.json');
    final priorityData = jsonDecode(priorityDataString);

    for (final item in projectData) {
      final project = MProject.fromJson(item);
      projects.value.add(project);
      for (final task in project.tasks) {
        tasks.value.add(task);
      }
    }

    for (final status in statusData) {
      statuses.value.add(MStatus.fromJson(status));
    }

    for (final priority in priorityData) {
      priorities.value.add(MPriority.fromJson(priority));
    }

    allTasks = tasks.value;
    updateLoading(value: false, elapsed: stopwatch.elapsedMilliseconds);
  }

  void resetTasks() {
    tasks.value = allTasks;
    update();
  }

  @override
  void onInit() {
    stopwatch.start();
    updateLoading(value: true);
    readJsonFile();
    super.onInit();
  }
}
