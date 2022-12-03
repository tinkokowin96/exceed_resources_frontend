import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:get/state_manager.dart';

class ColleagueHistoryController extends AppController {
  final colleague = m_colleagues[10];
  final activeIndex = 0.obs;
  final prevIndex = 0.obs;

  void updateIndex(int index) {
    prevIndex.value = activeIndex.value;
    activeIndex.value = index;
    switch (index) {
      case 0:
        break;
      default:
    }
    prevIndex.refresh();
    activeIndex.refresh();
  }
}
