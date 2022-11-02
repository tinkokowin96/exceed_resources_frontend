import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/views/error_view.dart';
import 'package:exceed_resources_frontend/app/routes/error_routes.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> errorRoutes = [
  GetPage(
    name: ErrorRoutes.permissionDenied,
    page: () => ErrorView(
      error: permissionResponse.message!,
    ),
    transitionDuration: Duration.zero,
  ),
];
