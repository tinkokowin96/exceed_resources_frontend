import 'package:exceed_resources_frontend/app/modules/core/controllers/fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskTableController>(
      () => TaskTableController(),
    );

    Get.lazyPut<FullscreenController>(
      () => FullscreenController(),
    );
  }
}
