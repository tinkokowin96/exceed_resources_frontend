import 'dart:convert';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/status_priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskTableController extends AppController {
  final statusController = TextEditingController();
  final columns = ['Task Name', 'Priority', 'Due Date', 'Project'];
  final projects = Rx<List<Project>>([]);
  final tasks = Rx<List<Task>>([]);
  final statuses = Rx<List<Status>>([]);
  final priorities = Rx<List<Priority>>([]);
  final selectedTask = Rxn<Task>();
  List<Task> allTasks = [];

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
                  Get.toNamed(AppRoutes.taskDetail);
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
          formatDate(date: each.dueDate),
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

  void filterTask(Project project) {
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
      final project = Project.fromJson(item);
      projects.value.add(project);
      for (final task in project.tasks) {
        tasks.value.add(task);
      }
    }

    for (final status in statusData) {
      statuses.value.add(Status.fromJson(status));
    }

    for (final priority in priorityData) {
      priorities.value.add(Priority.fromJson(priority));
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
