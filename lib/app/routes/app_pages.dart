import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/test.dart';
import 'package:exceed_resources_frontend/app/modules/core/views/error_view.dart';
import 'package:exceed_resources_frontend/app/modules/task/bindings/task_binding.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_detail.dart';
import 'package:exceed_resources_frontend/app/modules/task/views/project_view.dart';
import 'package:exceed_resources_frontend/app/modules/task/views/task_detail_view.dart';
import 'package:get/get.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/misc/bindings/misc_binding.dart';
import '../modules/misc/views/misc_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/task/views/task_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final initial =
      (locationPermission == null || locationPermission!.granted) ? AppRoutes.home : AppRoutes.permissionDenied;

  static final routes = [
    ...errorRoutes,
    GetPage(
      name: AppRoutes.home,
      page: () => const TaskDetailView(),
      //   page: () => const HomeView(),
      //   binding: HomeBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.task,
      page: () => const TaskView(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.taskDetail,
      page: () => const TaskDetailView(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.newProject,
      page: () => const ProjectView(),
      binding: TaskBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.report,
      page: () => const ReportView(),
      binding: ReportBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.misc,
      page: () => const MiscView(),
      binding: MiscBinding(),
      transitionDuration: Duration.zero,
    ),
  ];

  static final List<GetPage<dynamic>> errorRoutes = [
    GetPage(
      name: AppRoutes.permissionDenied,
      page: () => ErrorView(
        error: locationPermission != null ? locationPermission!.message! : '',
      ),
      transitionDuration: Duration.zero,
    ),
  ];
}
