import 'dart:convert';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/status_priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskTableController extends GetxController {
  final statusController = TextEditingController();
  final stopwatch = Stopwatch();
  final detailPage = false.obs;
  final loading = true.obs;
  final columns = ['Priority', 'Task Name', 'Due Date', 'Project'];
  final projects = [];
  final tasks = [];
  final statuses = [];
  final priorities = [];

  Map<String, List<Widget>> getRows({
    required BuildContext context,
    Project? activeProject,
  }) {
    final Map<String, List<Widget>> rowList = {};

    for (var each in tasks) {
      if (activeProject == null || activeProject.id == each.project.id) {
        rowList[each.id] = [
          StatusPriority(option: each.priority),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  each.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(context: context, size: EText.h4),
                ),
              ),
              StatusPriority(option: each.status),
            ],
          ),
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
    }
    return rowList;
  }

  Future<void> readJsonFile() async {
    stopwatch.start();
    final projectDataString = await rootBundle.loadString('assets/mock/project.json');
    final taskDataString = await rootBundle.loadString('assets/mock/task.json');
    final projectData = jsonDecode(projectDataString);
    final taskData = jsonDecode(taskDataString);

    for (final item in projectData) {
      projects.add(Project.fromJson(item));
    }
    for (final item in taskData) {
      tasks.add(Task.fromJson(item));
    }

    final elapsed = stopwatch.elapsed.inMilliseconds;
    if (elapsed < minimunLoading) {
      await Future.delayed(Duration(milliseconds: minimunLoading - elapsed));
    }
    loading.value = false;
    //delete after ui
    final detailController = Get.find<TaskDetailController>();
    detailController.loading.value = false;
    detailController.task.value = tasks.first;
    detailController.update();
    update();
  }

//   @override
//   void onInit() {
//     // stopwatch.start();
//     // readJsonFile();
//     super.onInit();
//   }
}
