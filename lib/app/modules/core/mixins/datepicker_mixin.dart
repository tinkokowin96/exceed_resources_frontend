import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DatePickerMixin on AppController {
  final allowedRange = DateTimeRange(
    start: DateTime(2002, 01, 01),
    end: DateTime(DateTime.now().year + 10, 01, 01),
  );
  final pickedDateController = TextEditingController();

  Future<void> showPicker() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
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

    pickedDateController.text = picked!.formatDate();
  }
}
