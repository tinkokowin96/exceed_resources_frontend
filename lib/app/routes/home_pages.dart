import 'package:exceed_resources_frontend/app/modules/core/utils/test.dart';
import 'package:exceed_resources_frontend/app/modules/home/bindings/home_binding.dart';
import 'package:exceed_resources_frontend/app/routes/home_routes.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> homeRoutes = [
  GetPage(
    name: HomeRoutes.home,
    page: () => const Test(),
    // page: () => const HomeView(),
    binding: HomeBinding(),
    transitionDuration: Duration.zero,
    maintainState: false,
  ),
];
