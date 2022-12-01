import 'package:exceed_resources_frontend/app/modules/core/controllers/attachment_fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:get/instance_manager.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttachmentFullscreenController>(() => AttachmentFullscreenController());
    Get.lazyPut<CalenderController>(() => CalenderController());
  }
}
