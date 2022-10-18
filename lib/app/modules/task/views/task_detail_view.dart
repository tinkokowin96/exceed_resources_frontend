import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailView extends GetView<TaskController> {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaskTableController());
    Get.put(TaskController(context: context));
    return AppLayout(
      currentMenu: EMenu.task,
      title: controller.activeTask.value!.name,
      content: Container(
        width: 200,
        height: 100,
        color: Colors.redAccent,
      ),
    );
  }
}
