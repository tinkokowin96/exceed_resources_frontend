import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/phase_form_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/quotation_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends AppController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phase = Rx<EExpandable>(EExpandable.minimize);
  final quotation = Rx<EExpandable>(EExpandable.minimize);

  void updateExpandable({required String type, required EExpandable expandable}) {
    switch (type) {
      case 'phase':
        if (phase.value == EExpandable.form) {
          Get.delete<PhaseFormController>();
        }
        if (expandable != EExpandable.minimize && quotation.value != EExpandable.minimize) {
          quotation.value = EExpandable.minimize;
          quotation.refresh();
        }
        phase.value = expandable;
        phase.refresh();
        break;
      case 'quotation':
        if (quotation.value == EExpandable.form) {
          Get.delete<QuotationFormController>();
        }
        if (expandable != EExpandable.minimize && phase.value != EExpandable.minimize) {
          phase.value = EExpandable.minimize;
          phase.refresh();
        }
        quotation.value = expandable;
        quotation.refresh();
        break;
      default:
    }
  }
}
