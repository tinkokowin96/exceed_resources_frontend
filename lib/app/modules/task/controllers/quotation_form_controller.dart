import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotationFormController extends GetxController with AttachmentMixin {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final budgetController = TextEditingController();
  final expenseController = TextEditingController();
  final startdateController = TextEditingController();
  final enddateController = TextEditingController();
  final remarkController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    budgetController.dispose();
    expenseController.dispose();
    startdateController.dispose();
    enddateController.dispose();
    remarkController.dispose();
    super.onClose();
  }

  void onSubmit() {}
}
