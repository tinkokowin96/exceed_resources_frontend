import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/table.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class TaskTable extends StatelessWidget {
  final TaskTableController controller;
  const TaskTable({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          child: Obx(() {
                            return SizedBox(
                              width: tbConstraint.maxWidth,
                              height: tbConstraint.maxHeight,
                              child: controller.loading.value
                                  ? Lottie.asset('assets/animation/loading.json')
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                        Expanded(
                                          child: AppTable(
                                            columns: controller.columns,
                                            data: controller.tasks.value,
                                            transformRows: (context, data) =>
                                                controller.transformRows(context: context, taskList: data),
                                          ),
                                        )
                                      ],
                                    ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
