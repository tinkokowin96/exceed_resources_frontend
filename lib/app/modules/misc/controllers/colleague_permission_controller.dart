import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague_permission.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_permission_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ColleaguePermissionController extends AppController {
  final permissions = m_colleague_permissions;
  final selected = Rxn<MColleaguePermission>();
  final nameController = TextEditingController();
  final forDepartmentController = TextEditingController();
  final forPositionController = TextEditingController();
  final permission = {
    'Name': Rx<String>(''),
    'Positions': Rx<List>([]),
    'Departments': Rx<List>([]),
    'For Positions': Rx<List>([]),
    'For Departments': Rx<List>([]),
    'Allow All': Rx<bool>(false),
    'View Basic Salary': Rx<bool>(false),
    'View Current Earning': Rx<bool>(false),
    'View Current Deduction': Rx<bool>(false),
    'View Resources': Rx<bool>(false),
    'View Comment': Rx<bool>(false),
    'Write Comment': Rx<bool>(false),
    'View Performance Point': Rx<bool>(false),
    'Pay Performance Point': Rx<bool>(false),
    'Payrise': Rx<bool>(false),
    'Resign': Rx<bool>(false),
    'History': Rx<bool>(false),
    'Permission': Rx<bool>(false),
    'Add': Rx<bool>(false),
  };
  final dropdownOptions = const [
    MOption(text: 'One', value: 'one'),
    MOption(text: 'Two', value: 'two'),
    MOption(text: 'Three', value: 'three'),
  ];
  String? id;

  void updateForm(MColleaguePermission? updatedPermission) {
    id = updatedPermission?.id;
    permission['Name']!.value = updatedPermission?.name ?? '';
    nameController.text = updatedPermission?.name ?? '';
    permission['Positions']!.value = updatedPermission?.positions ?? [];
    permission['Departments']!.value = updatedPermission?.departments ?? [];
    permission['Allow All']!.value = updatedPermission?.allowAll ?? false;
    permission['For Positions']!.value = updatedPermission?.forPositions ?? [];
    permission['For Departments']!.value = updatedPermission?.forDepartments ?? [];
    permission['View Basic Salary']!.value = updatedPermission?.viewBasicSalary ?? false;
    permission['View Current Earning']!.value = updatedPermission?.viewCurrentEarning ?? false;
    permission['View Resources']!.value = updatedPermission?.viewResources ?? false;
    permission['View Comment']!.value = updatedPermission?.viewComment ?? false;
    permission['Write Comment']!.value = updatedPermission?.writeComment ?? false;
    permission['View Performance Point']!.value = updatedPermission?.viewPerformancePoint ?? false;
    permission['Pay Performance Point']!.value = updatedPermission?.payPerformancePoint ?? false;
    permission['Payrise']!.value = updatedPermission?.payrise ?? false;
    permission['Resign']!.value = updatedPermission?.resign ?? false;
    permission['History']!.value = updatedPermission?.history ?? false;
    permission['Permission']!.value = updatedPermission?.permission ?? false;
    permission['Add']!.value = updatedPermission?.add ?? false;
    permission['Name']!.refresh();
    permission['Positions']!.refresh();
    permission['Departments']!.refresh();
    permission['Allow All']!.refresh();
    permission['For Positions']!.refresh();
    permission['For Departments']!.refresh();
    permission['View Basic Salary']!.refresh();
    permission['View Current Earning']!.refresh();
    permission['View Resources']!.refresh();
    permission['View Comment']!.refresh();
    permission['Write Comment']!.refresh();
    permission['View Performance Point']!.refresh();
    permission['Pay Performance Point']!.refresh();
    permission['Payrise']!.refresh();
    permission['Resign']!.refresh();
    permission['History']!.refresh();
    permission['Permission']!.refresh();
    permission['Add']!.refresh();
  }

  void updateSelected(MColleaguePermission updatedPermission) {
    if (selected.value != null && updatedPermission.id == selected.value!.id) {
      selected.value = null;
    } else {
      selected.value = updatedPermission;
    }
    updateForm(selected.value);
    selected.refresh();
  }

  void updatePermissionSwitch(String name, bool value) {
    permission[name]!.value = value;
    permission[name]!.refresh();
  }

  @override
  void onClose() {
    nameController.dispose();
    forDepartmentController.dispose();
    forPositionController.dispose();
    super.onClose();
  }
}
