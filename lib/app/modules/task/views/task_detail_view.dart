import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaskTableController());
    Get.put(TaskController(context: context));
    return GetBuilder<TaskTableController>(builder: (_) {
      return AppLayout(
        currentMenu: EMenu.task,
        loading: _.loading.value,
        title: 'Task Detail',
        content: Container(
          width: 200,
          height: 100,
          color: Colors.redAccent,
        ),
      );
    });
  }
}
