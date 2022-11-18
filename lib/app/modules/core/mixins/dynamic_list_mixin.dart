import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/dynamic_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DynamicListMixin on AppController {
  final List<Map> initials = [];
  final fields = Rx<Map<int, MDynamicField>>({});
  final Map<int, TextEditingController?> controllers = {};

  void removeFieldHandler(int index) {
    fields.value.removeWhere((key, value) => key == index);
    controllers.entries.where((each) => each.key == index).forEach((e) {
      if (e.value != null) {
        e.value!.dispose();
      }
    });
    controllers.removeWhere((key, value) => key == index);
    fields.refresh();
  }
}
