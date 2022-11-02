import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:get/get.dart';
import '../modules/misc/bindings/misc_binding.dart';
import '../modules/misc/views/misc_view.dart';

final List<GetPage<dynamic>> miscRoutes = [
  GetPage(
    name: MiscRoutes.misc,
    page: () => const MiscView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
];
