import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:get/get.dart';

class OnboardingPermissionController extends AppController {
  final permissions = Rx<List>(Get.arguments);

  void removePermission(String permission) {
    permissions.value.removeWhere((each) => each.value == permission);
    permissions.refresh();
  }
}
