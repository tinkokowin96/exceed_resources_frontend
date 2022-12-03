import 'package:exceed_resources_frontend/app/modules/salary/bindings/salary_binding.dart';
import 'package:exceed_resources_frontend/app/modules/salary/views/salary_view.dart';
import 'package:exceed_resources_frontend/app/routes/report_routes.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> reportRoutes = [
  GetPage(
    name: ReportRoutes.report,
    page: () => const SalaryView(),
    binding: SalaryBinding(),
    transitionDuration: Duration.zero,
  ),
];
