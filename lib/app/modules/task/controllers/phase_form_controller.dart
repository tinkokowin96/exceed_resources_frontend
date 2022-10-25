import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:flutter/material.dart';

class PhaseFormController extends AppController with AttachmentMixin {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final startdateController = TextEditingController();
  final enddateController = TextEditingController();
  final remarkController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    startdateController.dispose();
    enddateController.dispose();
    remarkController.dispose();
    super.onClose();
  }

  void onSubmit() {}
}
