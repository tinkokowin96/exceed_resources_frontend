import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/datepicker_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/payrises.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayriseController extends AppController with DatePickerMixin {
  final colleagues = Rx<List<MColleague>>(Get.arguments);
  final payrises = m_payrises;
  final formKey = GlobalKey<FormState>();
  final thresholdController = TextEditingController();
  final thrAmountController = TextEditingController();
  final amountController = TextEditingController();
  final thresholdOptions = const [
    MOption(text: 'Performance Rise', value: true),
    MOption(text: 'Tenure Rise', value: false),
  ];
  final isAbsolute = false.obs;
  final isPerformanceRise = true.obs;

  void updateAbsolute(bool? value) {
    if (value != null) {
      isAbsolute.value = value;
      isAbsolute.refresh();
    }
  }

  void updateDropdown(MOption? option) {
    if (option != null) {
      isPerformanceRise.value = option.value;
      isPerformanceRise.refresh();
    }
  }

  @override
  void onClose() {
    pickedDateController.dispose();
    thresholdController.dispose();
    thrAmountController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
