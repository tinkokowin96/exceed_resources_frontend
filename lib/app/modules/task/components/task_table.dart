import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/field_input.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/paginator.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/table.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class TaskTable extends GetView<TaskTableController> {
  final bool paginator;
  const TaskTable({
    Key? key,
    this.paginator = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaskTableController());
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SizedBox(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, tbConstraint) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).color.container,
                          borderRadius: BorderRadius.circular(
                            AppSize.xs,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
                          child: SizedBox(
                            width: tbConstraint.maxWidth,
                            height: tbConstraint.maxHeight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppFieldInput(
                                      controller: controller.statusController,
                                      width: AppSize.fWSmA,
                                      label: 'Status',
                                      size: ESize.sm,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppTextButton(
                                          onPressed: () {},
                                          disabled: true,
                                          text: 'Due Date',
                                          size: ESize.sm,
                                        ),
                                        AppTextButton(
                                          onPressed: () {},
                                          text: 'Assignment Date',
                                          size: ESize.sm,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: AppTable(
                                    columns: controller.columns,
                                    rows: controller.getRows(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                paginator
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                        child: Obx(
                          () {
                            return AppPaginator(
                              paginatedOptions: controller.paginatedOptions,
                              callback: controller.updatePage,
                              activePage: controller.activePage.value,
                            );
                          },
                        ),
                      )
                    : AppSizeBox.zero,
              ],
            ),
          );
        },
      ),
    );
  }
}
