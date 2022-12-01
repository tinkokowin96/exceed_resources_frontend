import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
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
                        style: AppTheme.text(
                          context: context,
                          weight: FontWeight.w500,
                          type: ETextType.subtitle,
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
                  controller.monthDays.value.map(
                    (each) => AppColumn(
                      spacing: AppSize.md,
                      children: List.generate(
                        (each.values.length / 7).round(),
                        (index) => Row(
                          children: List.from(
                            each.entries.toList().sublist(index * 7, (index * 7) + 7).map(
                                  (row) => Expanded(
                                    child: Text(
                                      row.key.replaceFirst('a', ''),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.text(
                                        context: context,
                                        type: row.value ? ETextType.body : ETextType.disabled,
                                      ),
                                    ),
                                  ),
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
          Flexible(
            flex: controller.picker ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: controller.picker ? AppSize.md : AppSize.lg, right: controller.picker ? AppSize.md : 0),
              child: controller.picker
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: AppButton(onPressed: () {}, text: 'Pick'),
                    )
                  : AppContainer(
                      topRadius: true,
                      borderRadius: AppSize.md,
                      child: Container(),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
