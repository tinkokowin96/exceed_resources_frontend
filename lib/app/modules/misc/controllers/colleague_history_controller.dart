import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:get/state_manager.dart';

class ColleagueHistoryController extends AppController {
  final colleague = m_colleagues[10];
  final activeIndex = 0.obs;
  final prevIndex = 0.obs;
  final historyType = EHistory.leave.obs;

  void updateIndex(int index) {
    prevIndex.value = activeIndex.value;
    activeIndex.value = index;
    switch (index) {
      case 0:
        historyType.value = EHistory.leave;
        break;
      case 1:
        historyType.value = EHistory.late;
        break;
      case 2:
        historyType.value = EHistory.overtime;
        break;
      case 3:
        historyType.value = EHistory.salary;
        break;
      case 4:
        historyType.value = EHistory.task;
        break;
      case 5:
        historyType.value = EHistory.report;
        break;
      default:
    }
    prevIndex.refresh();
    activeIndex.refresh();
    historyType.refresh();
  }
}
