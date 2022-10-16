import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProjectController extends GetxController with AttachmentMixin {
  final nameController = TextEditingController();
  final phase = Rx<EExpandable>(EExpandable.minimize);
  final quotation = Rx<EExpandable>(EExpandable.minimize);

  void updateExpandable({required String type, required EExpandable expandable}) {
    switch (type) {
      case 'phase':
        phase.value = expandable;
        phase.refresh();
        break;
      case 'quotation':
        quotation.value = expandable;
        quotation.refresh();
        break;
      default:
    }
  }
}
