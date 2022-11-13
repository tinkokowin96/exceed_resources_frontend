import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/expandable.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/seperated_section.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/table.dart';
import 'package:exceed_resources_frontend/app/modules/report/widgets/report_heading.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.report,
      controller: controller,
      content: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: AppSize.sm),
                child: Column(
                  children: [
                    const ReportHeading(),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.md),
                      child: Obx(
                        () => Column(children: [
                          if (controller.deduction.isFalse)
                            SeperatedSection(
                              data: [
                                MOption(text: 'Basic Salary', value: controller.report.value.basicSalary),
                              ],
                            ),
                          ...List.from(
                            controller.report.value.categories.map(
                              (each) => Expandable(
                                name: each.name,
                                toggleExpand: () => controller.toggleExpandable(name: each.name),
                                height: controller.expandables.value[each.name]!.value == EExpandable.expand
                                    ? App.height(context) * 0.6
                                    : null,
                                expand: controller.expandables.value[each.name]!.value == EExpandable.expand,
                                content: controller.expandables.value[each.name]!.value == EExpandable.expand
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: AppSize.md),
                                        child: AppTable(
                                          key: ValueKey('${each.name}_expand'),
                                          columns: List.from(each.fields[0].map((field) => field.name)),
                                          data: each.fields,
                                          transformRows: (context, data) => controller.transformRows(
                                            context: context,
                                            data: data,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        key: ValueKey('${each.name}_minimize'),
                                        width: 0,
                                      ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => SeperatedSection(
              data: [
                MOption(text: 'Total Deduction', value: controller.report.value.totalDeduction),
                if (controller.deduction.isFalse) ...[
                  MOption(text: 'Total Earning', value: controller.report.value.totalEarning),
                  MOption(
                    text: 'Paid',
                    value: controller.report.value.totalEarning - controller.report.value.totalDeduction,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
