import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final permission = permissions.firstWhere((each) => each.name == "task");
  final tableController = Get.find<TaskTableController>();
  final paginatedOptions = List.generate(
    5,
    (index) => MOption(
      text: (index + 1).toString(),
      value: index,
    ),
  ).obs;
  final activePage = 0.obs;
  final activeProject = Rxn<MProject>();

  void updatePage(int page) {
    activePage.value = page;
    activePage.refresh();
  }

  void updateActiveProject(MProject project) {
    activeProject.value = project;
    activeProject.refresh();
    tableController.filterTask(project);
  }
}
