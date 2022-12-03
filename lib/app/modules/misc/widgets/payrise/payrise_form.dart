import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/checkbox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/payrise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PayriseForm extends GetView<PayriseController> {
  const PayriseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return AppColumn(
          spacing: AppSize.md,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: AppSize.sm),
                child: controller.colleagues.value.isNotEmpty
                    ? Wrap(
                        spacing: AppSize.sm,
                        runSpacing: AppSize.sm,
                        children: List.from(
                          controller.colleagues.value.map(
                            (each) => AppContainer(
                              background: AppTheme.of(context).color.idle.withOpacity(0.05),
                              child: Text(
                                each.name,
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
                    : Row(
                        children: [
                          Expanded(
                            child: AppDropdown(
                              items: controller.thresholdOptions,
                              dropdownController: controller.thresholdController,
                              defaultOption: controller.thresholdOptions[0],
                              onChanged: ({checked, value}) => controller.updateDropdown(value),
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(left: AppSize.sm),
                                child: TextFormField(
                                  controller: controller.thrAmountController,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: AppTheme.text(context: context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'\d*'),
                                    ),
                                  ],
                                  decoration: AppThemeMiscs.inputStyle(
                                    context: context,
                                    hintText: controller.isPerformanceRise.isTrue
                                        ? 'Performance Point *'
                                        : 'Tenure In Month *',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            TextFormField(
              controller: controller.dateController,
              textAlignVertical: TextAlignVertical.center,
              style: AppTheme.text(context: context),
              readOnly: true,
              onTap: () => controller.showDatePicker(controller: controller.dateController),
              decoration: AppThemeMiscs.inputStyle(
                context: context,
                hintText: 'Pick Effective Date *',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => TextFormField(
                      controller: controller.amountController,
                      textAlignVertical: TextAlignVertical.center,
                      style: AppTheme.text(context: context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'\d*'),
                        ),
                      ],
                      decoration: AppThemeMiscs.inputStyle(
                        context: context,
                        hintText: controller.isAbsolute.isTrue ? 'Enter Rise Amount *' : 'Enter Rise Percent (0-100) *',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.md),
                  child: Obx(
                    () => AppCheckbox(
                      selected: controller.isAbsolute.isTrue,
                      onChanged: controller.updateAbsolute,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.md),
              child: AppButton(onPressed: () {}, text: 'Rise'),
            )
          ],
        );
      },
    );
  }
}
