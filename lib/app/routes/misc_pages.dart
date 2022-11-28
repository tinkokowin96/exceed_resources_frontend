import 'package:exceed_resources_frontend/app/modules/misc/views/add_event_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/article_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/calender_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/colleague_detail_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/colleague_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/create_article_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/late_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/leave_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/onboarding_permission_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/onboarding_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/organization_structure_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/overtime_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/payment_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/payrise_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/payroll_view.dart';
import 'package:exceed_resources_frontend/app/modules/misc/views/permission_view.dart';
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
  GetPage(
    name: MiscRoutes.onboarding,
    page: () => const OnboardingView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.onboardingPermission,
    page: () => const OnboardingPermissionView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.article,
    page: () => const ArticleView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.addEvent,
    page: () => const AddEventView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.calender,
    page: () => const CalenderView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.colleagueDetail,
    page: () => const ColleagueDetailView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.colleague,
    page: () => const ColleagueView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.late,
    page: () => const LateView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.leave,
    page: () => const LeaveView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.createArticle,
    page: () => const CreateArticleView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.organizationStructure,
    page: () => const OrganizationStructureView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.overtime,
    page: () => const OvertimeView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.payment,
    page: () => const PaymentView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.payrise,
    page: () => const PayriseView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.payroll,
    page: () => const PayrollView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: MiscRoutes.permission,
    page: () => const PermissionView(),
    binding: MiscBinding(),
    transitionDuration: Duration.zero,
  ),
];
