import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColleagueListingController extends AppController {
  final selected = Rx<Map<String, List<MColleagueM>>>({});
  final reamining = Rx<Map<String, List<MColleagueM>>>({});
  ColleagueListingController(
      Map<String, List<MColleagueM>> selectedColleagues, Map<String, List<MColleagueM>> remainingColleagues) {
    selected.value = selectedColleagues;
    reamining.value = remainingColleagues;
  }
  final sortbyController = TextEditingController();
  final departmentController = TextEditingController();
  final sortDirection = [true, false].obs;
  late final List<MOption> departments;

  @override
  void onInit() {
    final departmentMap = {};
    for (final colleagues in [...selected.value.values, ...reamining.value.values]) {
      if (!departmentMap.containsKey(colleagues[0].departmentId)) {
        departmentMap[colleagues[0].departmentId] = colleagues[0].departmentName;
      }
    }
    departments = List.from(
      departmentMap.entries.map(
        (each) => MOption(text: each.value, value: each.key),
      ),
    );
    super.onInit();
  }

  void changeSortDirection(int index) {
    sortDirection.value = List.from(
      sortDirection.asMap().entries.map((each) => each.key == index ? true : false),
    );
    sortDirection.refresh();
  }

//   void updateDropdown({})

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }

  @override
  void onClose() {
    sortbyController.dispose();
    departmentController.dispose();
    super.onClose();
  }
}
