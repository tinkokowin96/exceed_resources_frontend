import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/views/attachment_fullscreen_view.dart';
import 'package:exceed_resources_frontend/app/modules/core/views/fullscreen_view.dart';
import 'package:exceed_resources_frontend/app/modules/home/bindings/home_binding.dart';
import 'package:exceed_resources_frontend/app/routes/chat_pages.dart';
import 'package:exceed_resources_frontend/app/routes/error_pages.dart';
import 'package:exceed_resources_frontend/app/routes/error_routes.dart';
import 'package:exceed_resources_frontend/app/routes/home_pages.dart';
import 'package:exceed_resources_frontend/app/routes/home_routes.dart';
import 'package:exceed_resources_frontend/app/routes/misc_pages.dart';
import 'package:exceed_resources_frontend/app/routes/report_pages.dart';
import 'package:exceed_resources_frontend/app/routes/task_pages.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final initial = permissionResponse.granted ? HomeRoutes.home : ErrorRoutes.permissionDenied;

  static final routes = [
    ...errorRoutes,
    ...homeRoutes,
    ...taskRoutes,
    ...chatRoutes,
    ...reportRoutes,
    ...miscRoutes,
    GetPage(
      name: AppRoutes.fullscreen,
      page: () => const FullscreenView(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: AppRoutes.attachmentFullscreen,
      page: () => const AttachmentFullscreenView(),
      binding: HomeBinding(),
      transitionDuration: Duration.zero,
    ),
  ];
}
