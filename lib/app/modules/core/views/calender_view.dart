import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/calender/calender_days.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/calender/calender_events.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
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
      bottomSafeArea: false,
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
              onChange: (index) => controller.updateMonth(index + 1),
              startPage: controller.selectedMonth.value - 1,
              fraction: 0.45,
              showIndicator: false,
            ),
          ),
          const CalenderDays(),
          Flexible(
            flex: controller.picker || controller.rangePicker ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: controller.picker || controller.rangePicker ? AppSize.md : AppSize.lg,
                right: controller.picker || controller.rangePicker ? AppSize.md : 0,
              ),
              child: controller.picker || controller.rangePicker
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              text: controller.rangeStartDate.value?.formatDate() ??
                                  controller.selected.value.formatDate(short: controller.rangePicker),
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                size: EText.h2,
                                type: ETextType.subtitle,
                              ),
                              children: controller.rangePicker
                                  ? [
                                      TextSpan(
                                        text:
                                            ' - ${controller.rangeEndDate.value == null ? '' : controller.rangeEndDate.value!.formatDate()}',
                                        style: AppTheme.text(
                                          context: context,
                                          weight: FontWeight.w500,
                                          size: EText.h2,
                                          type: ETextType.subtitle,
                                        ),
                                      )
                                    ]
                                  : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSize.sm),
                          child: AppButton(
                            onPressed: () {
                              controller.picked(
                                controller.rangePicker &&
                                        controller.rangeStartDate.value != null &&
                                        controller.rangeEndDate.value != null
                                    ? DateTimeRange(
                                        start: controller.rangeStartDate.value!,
                                        end: controller.rangeEndDate.value!,
                                      )
                                    : controller.selected.value,
                              );
                            },
                            text: 'Pick',
                          ),
                        ),
                      ],
                    )
                  : const CalenderEvents(),
            ),
          ),
        ],
      ),
    );
  }
}
