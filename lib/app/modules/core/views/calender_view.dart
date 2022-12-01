import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.fullscreen(
      title: controller.picker ? 'Pick Date' : 'Calender',
      controller: controller,
      headerTail: AppDropdown(
        items: controller.yearOptions,
        onChanged: ({checked, value}) => controller.updateYear(value),
        defaultOption: controller.yearOptions.firstWhere((each) => each.text == controller.selectedYear.toString()),
        customSelector: Obx(
          () => Text(
            controller.selectedYear.toString(),
            style: AppTheme.text(
              context: context,
              weight: FontWeight.w500,
              type: ETextType.subtitle,
            ),
          ),
        ),
      ),
      content: Column(
        children: [
          Obx(
            () => AppCarousel(
              data: List.from(
                EMonth.values.map(
                  (each) => Text(
                    each.name.firstCapitalize(),
                    textAlign: TextAlign.center,
                    style: AppTheme.text(
                      context: context,
                      weight: FontWeight.w500,
                      size: EText.h1,
                    ),
                  ),
                ),
              ),
              startPage: controller.selectedMonth.value - 1,
              fraction: 0.45,
              showIndicator: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.md),
            child: AppColumn(
              spacing: AppSize.sm,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.from(
                    EWeekDay.values.map(
                      (each) => Text(
                        each.name.firstCapitalize(),
                        textAlign: TextAlign.center,
                        style: AppTheme.text(context: context, weight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
