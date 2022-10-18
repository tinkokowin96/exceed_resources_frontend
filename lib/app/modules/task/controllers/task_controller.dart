import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final BuildContext context;
  TaskController({required this.context});
  final permission = permissions.firstWhere((each) => each.name == "task");
  final taskController = Get.find<TaskTableController>();
  final paginatedOptions = List.generate(
    5,
    (index) => Option(
      text: (index + 1).toString(),
      value: index,
    ),
  ).obs;
  final taskRows = Rx<Map<String, List<Widget>>>({});
  final activePage = 0.obs;
  final activeProject = Rxn<Project>();
  late final activeTask = Rxn<Task>(taskController.tasks.first);

  @override
  void onInit() {
    taskRows.value = taskController.getRows(context: context);
    taskRows.refresh();
    super.onInit();
  }

  void updatePage(int page) {
    activePage.value = page;
    activePage.refresh();
  }

  void updateActiveProject(String id) {
    activeProject.value = taskController.projects.firstWhere((each) => each.id == id);
    activeProject.refresh();
    taskRows.value = taskController.getRows(
      context: context,
      activeProject: activeProject.value,
    );
    taskRows.refresh();
  }

  void updateActiveTask(String id) {
    activeTask.value = taskController.tasks.firstWhere((each) => each.id == id);
    activeTask.refresh();
    Get.toNamed(AppRoutes.taskDetail);
  }
}
