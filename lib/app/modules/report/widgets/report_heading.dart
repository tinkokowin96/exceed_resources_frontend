import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/report/controllers/report_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReportHeading extends GetView<ReportController> {
  const ReportHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return GestureDetector(
                onTap: controller.toggleSection,
                child: Text(
                  'Earning',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h2,
                    weight: FontWeight.w500,
                    type: controller.deduction.value ? ETextType.subtitle : ETextType.body,
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.md),
              child: Obx(
                () {
                  return InkWell(
                    onTap: controller.toggleSection,
                    child: Text(
                      'Deduction',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h2,
                        weight: FontWeight.w500,
                        type: controller.deduction.value ? ETextType.body : ETextType.subtitle,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => controller.showDatePicker(
              controller: controller.dateRangeController,
              range: true,
            ),
            icon: const Icon(Icons.date_range),
          ),
        )
      ],
    );
  }
}
