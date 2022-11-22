import 'package:exceed_resources_frontend/app/modules/misc/controllers/add_event_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/article_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/create_article_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/late_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/leave_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_permission_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/organization_structure_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/overtime_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/payment_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/payroll_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/permission_controller.dart';
import 'package:get/get.dart';

import '../controllers/misc_controller.dart';

class MiscBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiscController>(() => MiscController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<OnboardingPermissionController>(() => OnboardingPermissionController());
    Get.lazyPut<ArticleController>(() => ArticleController());
    Get.lazyPut<CreateArticleController>(() => CreateArticleController());
    Get.lazyPut<AddEventController>(() => AddEventController());
    Get.lazyPut<CalenderController>(() => CalenderController());
    Get.lazyPut<ColleagueDetailController>(() => ColleagueDetailController());
    Get.lazyPut<ColleagueController>(() => ColleagueController());
    Get.lazyPut<LateController>(() => LateController());
    Get.lazyPut<LeaveController>(() => LeaveController());
    Get.lazyPut<OrganizationStructureController>(() => OrganizationStructureController());
    Get.lazyPut<OvertimeController>(() => OvertimeController());
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<PayrollController>(() => PayrollController());
    Get.lazyPut<PayrollController>(() => PayrollController());
    Get.lazyPut<PermissionController>(() => PermissionController());
  }
}
