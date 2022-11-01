import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:get/state_manager.dart';

class ChatGroupController extends AppController {
  final expendable = Rx<EExpandable>(EExpandable.minimize);

  void toggleExpendable() {
    expendable.value = expendable.value == EExpandable.minimize ? EExpandable.expand : EExpandable.minimize;
    expendable.refresh();
  }
}
