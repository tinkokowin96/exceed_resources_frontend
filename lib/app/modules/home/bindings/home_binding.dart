import 'package:exceed_resources_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_history_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TaskTableController>(() => TaskTableController(), tag: 'home');
    Get.lazyPut<ColleagueHistoryController>(() => ColleagueHistoryController());
  }
}
