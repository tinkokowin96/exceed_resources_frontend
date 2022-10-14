import 'package:exceed_resources_frontend/app/modules/task/controllers/new_project_controller.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewProjectController>(
      () => NewProjectController(),
    );
  }
}
