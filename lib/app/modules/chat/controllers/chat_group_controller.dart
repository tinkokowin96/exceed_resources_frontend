import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:get/state_manager.dart';

class ChatGroupController extends AppController {
  final expandable = Rx<EExpandable>(EExpandable.minimize);

  void toggleExpandable() {
    expandable.value = expandable.value == EExpandable.minimize ? EExpandable.expand : EExpandable.minimize;
    expandable.refresh();
  }
}
