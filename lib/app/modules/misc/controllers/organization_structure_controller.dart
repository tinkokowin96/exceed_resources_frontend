import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:get/get.dart';

class OrganizationStructureController extends AppController {
  late final data = Rx<Map<int, Map<int, Map<EStructure, dynamic>>>>({
    0: {
      0: {EStructure.ceo: organization}
    }
  });

  Map<int, Map<EStructure, dynamic>> getChildren({
    required List items,
    EStructure type = EStructure.department,
  }) {
    final Map<int, Map<EStructure, dynamic>> transformed = {};
    items.asMap().entries.forEach((each) {
      transformed[each.key] = {type: each.value};
    });
    return transformed;
  }

  void populatedChildren(List<MDepartment> departments, int row) {
    MDepartment checkDepartment = departments[0];
    bool hasChildren = true;
    int rowIndex = row + 1;
    data.value[rowIndex] = getChildren(items: departments);

    while (hasChildren) {
      if (checkDepartment.departments.isEmpty) {
        hasChildren = false;
        break;
      } else {
        rowIndex++;
        final children = getChildren(items: checkDepartment.departments);
        data.value[rowIndex] = children;
        checkDepartment = children.values.first.values.first;
      }
    }
    data.value.removeWhere((key, value) => key > rowIndex);
  }

  void updateStructure(int row, int column) {
    final parent = data.value[row]![column]!;
    final type = parent.keys.first;
    int rowIndex = row;
    late final List items;
    Map<int, Map<EStructure, dynamic>> children;
    EStructure childrenType = EStructure.department;
    if (type == EStructure.ceo) {
      final isDepartment = parent.values.first.departments.isNotEmpty;
      items = isDepartment ? parent.values.first.departents : parent.values.first.topManagements;
      childrenType = isDepartment ? EStructure.department : EStructure.topManagement;
    } else {
      items = parent.values.first.departments;
    }
    rowIndex++;
    children = getChildren(
      items: items,
      type: childrenType,
    );
    data.value[rowIndex] = children;
    if (childrenType == EStructure.topManagement) {
      rowIndex++;
      children = getChildren(
        items: children.values.first.values.first.departments,
      );
      data.value[rowIndex] = children;
    }
    if (children.values.isNotEmpty && children.values.first.values.first.departments.isNotEmpty) {
      populatedChildren(
        children.values.first.values.first.departments,
        rowIndex + 1,
      );
    } else {
      data.value.removeWhere((key, value) => key > rowIndex);
    }
    data.refresh();
  }

  @override
  void onInit() {
    updateStructure(0, 0);
    super.onInit();
  }
}
