import 'package:exceed_resources_frontend/app/modules/chat/views/create_group_view.dart';
import 'package:exceed_resources_frontend/app/modules/home/bindings/home_binding.dart';
import 'package:exceed_resources_frontend/app/routes/home_routes.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> homeRoutes = [
  GetPage(
    name: HomeRoutes.home,
    page: () => const CreateGroupView(),
    //   page: () => const HomeView(),
    binding: HomeBinding(),
    transitionDuration: Duration.zero,
  ),
];
