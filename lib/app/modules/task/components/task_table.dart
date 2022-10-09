import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/field_input.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class TaskTable extends GetView<TaskTableController> {
  const TaskTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaskTableController());
    return Expanded(
      child: LayoutBuilder(builder: (context, constraint) {
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
              width: constraint.maxWidth,
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
