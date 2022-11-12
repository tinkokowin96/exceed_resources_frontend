import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DateRangePickerMixin on AppController {
  final allowedRange = DateTimeRange(
    start: DateTime(2002, 01, 01),
    end: DateTime.now(),
  );
  final pickedRange = Rxn<DateTimeRange>();

  void pickedDateRange() {}

  Future<void> showPicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      firstDate: allowedRange.start,
      lastDate: allowedRange.end,
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: AppThemeData.isDarkTheme
              ? ColorScheme.dark(
                  primary: AppTheme.of(context).color.secondary,
                  onPrimary: AppTheme.of(context).color.body,
                )
              : ColorScheme.light(
                  primary: AppTheme.of(context).color.secondary,
                  onPrimary: AppTheme.of(context).color.body,
                ),
        ),
        child: child!,
      ),
    );

    pickedRange.value = picked;
    pickedDateRange();
  }
}
