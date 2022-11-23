import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:get/get.dart';

class OnboardingPermissionController extends AppController {
  final permissions = Rx<List>(Get.arguments);
  final selectedColleagues = Rx<Map<String, List<MColleagueM>>>({});
  final remainingColleagues = Rx<Map<String, List<MColleagueM>>>({});

  void removePermission(String permission) {
    permissions.value.removeWhere((each) => each.value == permission);
    permissions.refresh();
  }

  void updateColleague({bool add = true, MColleagueM? colleague, String? departmentId}) {
    if (colleague != null) {
      if (add) {
        if (selectedColleagues.value.containsKey(colleague.departmentId)) {
          selectedColleagues.value[colleague.departmentId!]!.add(colleague);
        } else {
          selectedColleagues.value[colleague.departmentId!] = [colleague];
        }
        remainingColleagues.value[colleague.departmentId!]!.removeWhere((each) => each.id == colleague.id);
      } else {
        if (remainingColleagues.value.containsKey(colleague.departmentId)) {
          remainingColleagues.value[colleague.departmentId!]!.add(colleague);
        } else {
          remainingColleagues.value[colleague.departmentId!] = [colleague];
        }
        selectedColleagues.value[colleague.departmentId!]!.removeWhere((each) => each.id == colleague.id);
      }
    } else {
      if (add) {
        if (selectedColleagues.value.containsKey(departmentId)) {
          selectedColleagues.value[departmentId!]!.addAll(remainingColleagues.value[departmentId]!);
        } else {
          selectedColleagues.value[departmentId!] = [...remainingColleagues.value[departmentId]!];
        }
        remainingColleagues.value.removeWhere((key, value) => key == departmentId);
      } else {
        if (remainingColleagues.value.containsKey(departmentId)) {
          remainingColleagues.value[departmentId!]!.addAll(remainingColleagues.value[departmentId]!);
        } else {
          remainingColleagues.value[departmentId!] = [...remainingColleagues.value[departmentId]!];
        }
        selectedColleagues.value.removeWhere((key, value) => key == departmentId);
      }
    }
    selectedColleagues.refresh();
    remainingColleagues.refresh();
  }

  @override
  void onInit() {
    for (final colleague in m_colleagues) {
      if (remainingColleagues.value.containsKey(colleague.departmentId!)) {
        remainingColleagues.value[colleague.departmentId!]!.add(colleague);
      } else {
        remainingColleagues.value[colleague.departmentId!] = [colleague];
      }
      remainingColleagues.refresh();
    }
    super.onInit();
  }
}
