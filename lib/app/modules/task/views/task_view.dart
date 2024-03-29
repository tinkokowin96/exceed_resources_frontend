import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/paginator.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project_card.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_table.dart';
import 'package:exceed_resources_frontend/app/routes/task_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.task,
      controller: controller,
      content: LayoutBuilder(
        builder: (context, constriant) {
          return Column(
            children: [
              AppSizeBox.md,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projects',
                    style: AppTheme.text(
                      context: context,
                      size: EText.h2,
                      weight: FontWeight.w500,
                    ),
                  ),
                  AppTextButton(
                    text: 'New Project',
                    onPressed: () => Get.toNamed(TaskRoutes.newProject),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.md, bottom: AppSize.lg),
                child: SizedBox(
                  width: constriant.maxWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.from(
                        controller.tableController.projects.value.map(
                          (each) => Obx(
                            () => ProjectCard(
                              callback: () => controller.updateActiveProject(each),
                              project: each,
                              active: controller.activeProject.value == null
                                  ? false
                                  : controller.activeProject.value!.id == each.id,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TaskTable(controller: controller.tableController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                child: Obx(
                  () => AppPaginator(
                    paginatedOptions: controller.paginatedOptions,
                    callback: controller.updatePage,
                    activePage: controller.activePage.value,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
