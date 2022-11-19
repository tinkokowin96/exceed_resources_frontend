import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/dynamic_field_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DynamicListMixin on AppController {
  final List<Map> initials = [];
  final fields = Rx<Map<int, MDynamicField>>({});
  final Map<int, TextEditingController?> controllers = {};

  void removeFieldHandler(int index) {
    fields.value.removeWhere((key, value) => value.oriKey == index);
    controllers.entries.where((each) => each.key == index).forEach((e) {
      if (e.value != null) {
        e.value!.dispose();
      }
    });
    controllers.removeWhere((key, value) => key == index);
    fields.refresh();
  }

  void reorderField(int key, bool up) {
    final updatedFieldKey = up ? key - 1 : key + 1;
    final currentField = fields.value[key]!;
    final updatedField = fields.value[updatedFieldKey]!;
    currentField.key = updatedFieldKey;
    updatedField.key = key;
    fields.value[key] = updatedField;
    fields.value[updatedFieldKey] = currentField;
    fields.refresh();
  }
}
