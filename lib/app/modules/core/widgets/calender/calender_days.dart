import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
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
                          (each.value.values.length / 7).round(),
                          (index) => Row(
                            children: List.from(
                              each.value.entries.toList().sublist(index * 7, (index * 7) + 7).map(
                                (day) {
                                  final date = DateTime(
                                    day.key.contains('p') || day.key.contains('n')
                                        ? controller.getDisabledMonthYear(
                                            prefix: day.key.contains('p') ? 'p' : 'n',
                                            checkMonth: each.key,
                                            month: false,
                                          )
                                        : controller.selectedYear.value,
                                    day.key.contains('p') || day.key.contains('n')
                                        ? controller.getDisabledMonthYear(
                                            prefix: day.key.contains('p') ? 'p' : 'n',
                                            checkMonth: each.key,
                                          )
                                        : each.key + 1,
                                    int.parse(
                                      day.key.replaceFirst('p', '').replaceFirst('n', ''),
                                    ),
                                  );

                                  final inRange = controller.rangePicker ? controller.checkDateInRange(date) : false;
                                  final dateSelected =
                                      (controller.rangeStartDate.value == null && date == controller.selected.value) ||
                                          inRange ||
                                          (controller.rangeStartDate.value != null &&
                                              date == controller.rangeStartDate.value);
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () => day.value
                                          ? (controller.rangePicker
                                              ? controller.pickRange(date)
                                              : controller.selectDate(date))
                                          : null,
                                      child: Center(
                                        child: DecoratedBox(
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
                                                day.key.replaceFirst('p', '').replaceFirst('n', ''),
                                                textAlign: TextAlign.center,
                                                style: AppTheme.text(
                                                  context: context,
                                                  type: day.value
                                                      ? (dateSelected ? ETextType.white : ETextType.body)
                                                      : ETextType.disabled,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
