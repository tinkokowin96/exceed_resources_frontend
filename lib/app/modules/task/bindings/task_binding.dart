import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<ProjectController>(() => ProjectController());
    Get.lazyPut<TaskDetailController>(() => TaskDetailController());
  }
}
