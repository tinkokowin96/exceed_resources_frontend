import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      header: true,
      currentMenu: EMenu.task,
      content: Column(
        children: const [
          AppSizeBox.md,
          TaskTable(
            paginator: true,
          )
        ],
      ),
    );
  }
}
