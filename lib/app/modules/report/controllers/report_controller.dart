import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/daterangepicker_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/report.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:get/get.dart';

class ReportController extends AppController with DateRangePickerMixin {
  final deduction = false.obs;
  final report = Rx<MReport>(
    MReport(
      basicSalary: reports[0].basicSalary,
      totalEarning: reports[0].totalEarning,
      totalDeduction: reports[0].totalDeduction,
      categories: List.from(
        reports[0].categories.where((each) => each.earning == true),
      ),
    ),
  );
  final expandables = Rx<Map<String, Rx<EExpandable>>>({});

  void toggleExpandable({required String name}) {
    expandables.value[name]!.value =
        expandables.value[name]!.value == EExpandable.minimize ? EExpandable.expand : EExpandable.minimize;
    expandables.value[name]!.refresh();
  }

  void toggleSection() {
    deduction.value = !deduction.value;
    if (deduction.value) {
      report.value = MReport(
        basicSalary: reports[0].basicSalary,
        totalEarning: reports[0].totalEarning,
        totalDeduction: reports[0].totalDeduction,
        categories: List.from(
          reports[0].categories.where((each) => each.earning == false),
        ),
      );
    } else {
      report.value = MReport(
        basicSalary: reports[0].basicSalary,
        totalEarning: reports[0].totalEarning,
        totalDeduction: reports[0].totalDeduction,
        categories: List.from(
          reports[0].categories.where((each) => each.earning == true),
        ),
      );
    }
    deduction.refresh();
    report.refresh();
  }

  Map<String, List<Widget>> transformRows({
    required BuildContext context,
    required List<dynamic> data,
  }) {
    final Map<String, List<Widget>> rowList = {};
    for (int i = 0; i < data.length; i++) {
      rowList[i.toString()] = List.from(
        data[i].map(
          (each) => GestureDetector(
            onTap: each.fieldType == EField.colleague ? () {} : null,
            child: Text(
              each.fieldType == EField.date
                  ? (each.value as DateTime).formatDate()
                  : each.fieldType == EField.colleague
                      ? each.value.name
                      : each.value.toString(),
              style: AppTheme.text(
                context: context,
                type: each.fieldType == EField.colleague ? ETextType.primary : ETextType.body,
              ),
            ),
          ),
        ),
      );
    }
    return rowList;
  }

  @override
  void onInit() {
    for (final category in reports[0].categories) {
      expandables.value[category.name] = EExpandable.minimize.obs;
    }
    expandables.refresh();
    super.onInit();
  }
}
