import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TaskDetail extends GetView<TaskDetailController> {
  final Task task;
  const TaskDetail({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
