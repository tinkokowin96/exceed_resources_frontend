import 'package:exceed_resources_frontend/app/modules/task/bindings/task_binding.dart';
import 'package:exceed_resources_frontend/app/modules/task/views/project_view.dart';
import 'package:exceed_resources_frontend/app/modules/task/views/task_detail_view.dart';
import 'package:exceed_resources_frontend/app/modules/task/views/task_view.dart';
import 'package:exceed_resources_frontend/app/routes/task_routes.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> taskRoutes = [
  GetPage(
    name: TaskRoutes.task,
    page: () => const TaskView(),
    binding: TaskBinding(),
    transitionDuration: Duration.zero,
    maintainState: false,
  ),
  GetPage(
    name: TaskRoutes.taskDetail,
    page: () => const TaskDetailView(),
    binding: TaskBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: TaskRoutes.taskDetail,
    page: () => const TaskDetailView(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: TaskRoutes.newProject,
    page: () => const ProjectView(),
    binding: TaskBinding(),
    transitionDuration: Duration.zero,
  ),
];
