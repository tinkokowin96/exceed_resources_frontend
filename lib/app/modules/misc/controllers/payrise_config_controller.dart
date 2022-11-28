import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class PayriseConfigController extends AppController {
  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();

  @override
  void onClose() {
    dateController.dispose();
    super.onClose();
  }
}
