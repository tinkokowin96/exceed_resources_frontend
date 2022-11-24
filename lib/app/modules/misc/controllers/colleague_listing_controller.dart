import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColleagueListingController extends AppController {
  final selected = Rx<Map<String, List<MColleague>>>({});
  final reamining = Rx<Map<String, List<MColleague>>>({});
  ColleagueListingController(
      Map<String, List<MColleague>> selectedColleagues, Map<String, List<MColleague>> remainingColleagues) {
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
      if (!departmentMap.containsKey(colleagues[0].departments[0].id)) {
        departmentMap[colleagues[0].departments[0].id] = colleagues[0].departments[0].name;
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

  @override
  void onClose() {
    sortbyController.dispose();
    departmentController.dispose();
    super.onClose();
  }
}
