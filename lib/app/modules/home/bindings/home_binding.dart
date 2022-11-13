import 'package:exceed_resources_frontend/app/modules/core/controllers/fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/misc_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TaskTableController>(() => TaskTableController(), tag: 'home');
    Get.lazyPut<FullscreenController>(() => FullscreenController());
    Get.lazyPut<MiscController>(() => MiscController());
  }
}
