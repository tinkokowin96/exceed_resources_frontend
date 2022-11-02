import 'package:exceed_resources_frontend/app/routes/report_routes.dart';
import 'package:get/get.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';

final List<GetPage<dynamic>> reportRoutes = [
  GetPage(
    name: ReportRoutes.report,
    page: () => const ReportView(),
    binding: ReportBinding(),
    transitionDuration: Duration.zero,
  ),
];
