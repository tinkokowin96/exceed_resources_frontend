import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/daterangepicker_mixin.dart';
import 'package:get/get.dart';

class ReportController extends AppController with DateRangePickerMixin {
  final deduction = false.obs;

  void toggleSection() {
    deduction.value = !deduction.value;
    deduction.refresh();
  }
}
