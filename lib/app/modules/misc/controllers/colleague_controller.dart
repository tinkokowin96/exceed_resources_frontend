import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:get/get.dart';

class ColleagueController extends AppController {
  final selected = Rx<List<MColleague>>([]);

  void updateSelected(bool value, MColleague colleague) {
    if (value) {
      selected.value.add(colleague);
    } else {
      selected.value.removeWhere((each) => each.id == colleague.id);
    }
    selected.refresh();
  }
}
