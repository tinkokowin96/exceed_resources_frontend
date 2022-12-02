import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CalenderDays extends GetView<CalenderController> {
  const CalenderDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.md),
          child: AppColumn(
            spacing: AppSize.sm,
            children: [
              Row(
                children: List.from(
                  EWeekDay.values.map(
                    (each) => Expanded(
                      child: Text(
                        each.name.firstCapitalize(),
                        textAlign: TextAlign.center,
                        style: AppTheme.text(
                          context: context,
                          weight: FontWeight.w500,
                          type: ETextType.subtitle,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Obx(
          () => AppCarousel(
            data: List.from(
              List.from(
                controller.monthDays.value.asMap().entries.map(
                      (each) => AppColumn(
                        spacing: AppSize.md,
                        children: List.generate(
                          (each.value.length / 7).round(),
                          (index) => Row(
                            children: List.from(
                              each.value.sublist(index * 7, (index * 7) + 7).map(
                                (day) {
                                  final date = DateTime(
                                    day.prev || day.next
                                        ? controller.getDisabledMonthYear(
                                            prev: day.prev, checkMonth: each.key, month: false)
                                        : controller.selectedYear.value,
                                    day.prev || day.next
                                        ? controller.getDisabledMonthYear(prev: day.prev, checkMonth: each.key)
                                        : each.key + 1,
                                    day.day,
                                  );

                                  final inRange = controller.rangePicker
                                      ? controller.checkDateInRange(
                                          date,
                                          controller.rangeStartDate.value,
                                          controller.rangeEndDate.value,
                                        )
                                      : false;
                                  final dateSelected =
                                      (controller.rangeStartDate.value == null && date == controller.selected.value) ||
                                          inRange ||
                                          (controller.rangeStartDate.value != null &&
                                              date == controller.rangeStartDate.value);
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () => day.prev == false && day.next == false
                                          ? (controller.rangePicker
                                              ? controller.pickRange(date)
                                              : controller.selectDate(date, day.events))
                                          : null,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: dateSelected
                                                  ? AppTheme.of(context).color.secondary
                                                  : Colors.transparent,
                                              borderRadius: BorderRadius.circular(AppSize.lg),
                                              border: Border.all(
                                                color: controller.today != controller.selected.value &&
                                                        date == controller.today
                                                    ? AppTheme.of(context).color.secondary
                                                    : Colors.transparent,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: SizedBox(
                                              width: AppSize.lg,
                                              height: AppSize.lg,
                                              child: Center(
                                                child: Text(
                                                  day.day.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: AppTheme.text(
                                                    context: context,
                                                    type: day.prev == false && day.next == false
                                                        ? (dateSelected ? ETextType.white : ETextType.body)
                                                        : ETextType.disabled,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (!controller.picker && !controller.rangePicker)
                                            Positioned(
                                              bottom: 0,
                                              child: AppRow(
                                                spacing: 2,
                                                children: List.from(
                                                  day.events.map(
                                                    (evt) => AppCircle.container(width: 6, color: evt.color),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            onChange: (index) => controller.updateMonth(index + 1),
            startPage: controller.selectedMonth.value - 1,
            showIndicator: false,
            sameHeight: false,
          ),
        ),
      ],
    );
  }
}
