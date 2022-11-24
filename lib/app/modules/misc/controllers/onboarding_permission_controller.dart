import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:get/get.dart';

class OnboardingPermissionController extends AppController {
  final permissions = Rx<List>(Get.arguments);
  final selectedColleagues = Rx<Map<String, List<MColleague>>>({});
  final remainingColleagues = Rx<Map<String, List<MColleague>>>({});

  void removePermission(String permission) {
    permissions.value.removeWhere((each) => each.value == permission);
    permissions.refresh();
  }

  void updateColleague({bool add = true, MColleague? colleague, String? departmentId}) {
    if (colleague != null) {
      if (add) {
        if (selectedColleagues.value.containsKey(colleague.departments[0].id)) {
          selectedColleagues.value[colleague.departments[0].id]!.add(colleague);
        } else {
          selectedColleagues.value[colleague.departments[0].id] = [colleague];
        }
        remainingColleagues.value[colleague.departments[0].id]!.removeWhere((each) => each.id == colleague.id);
      } else {
        if (remainingColleagues.value.containsKey(colleague.departments[0].id)) {
          remainingColleagues.value[colleague.departments[0].id]!.add(colleague);
        } else {
          remainingColleagues.value[colleague.departments[0].id] = [colleague];
        }
        selectedColleagues.value[colleague.departments[0].id]!.removeWhere((each) => each.id == colleague.id);
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
      if (colleague.topManagement) {
        final tcolleague = MColleague(
          id: colleague.id,
          name: colleague.name,
          image: colleague.image,
          position: colleague.position,
          email: colleague.email,
          phone: colleague.phone,
          basicSalary: colleague.basicSalary,
          departments: [MDepartment(id: 'dep_top', name: 'Top Management')],
        );
        if (remainingColleagues.value.containsKey(tcolleague.departments[0].id)) {
          remainingColleagues.value[tcolleague.departments[0].id]!.add(tcolleague);
        } else {
          remainingColleagues.value[tcolleague.departments[0].id] = [tcolleague];
        }
      } else {
        if (remainingColleagues.value.containsKey(colleague.departments[0].id)) {
          remainingColleagues.value[colleague.departments[0].id]!.add(colleague);
        } else {
          remainingColleagues.value[colleague.departments[0].id] = [colleague];
        }
      }
    }
    remainingColleagues.refresh();
    super.onInit();
  }
}
