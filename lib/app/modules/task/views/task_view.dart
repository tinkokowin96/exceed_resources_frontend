import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/paginator.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_table.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TaskController(context: context));
    return AppLayout(
      header: false,
      currentMenu: EMenu.task,
      content: LayoutBuilder(
        builder: (context, constriant) {
          return Column(
            children: [
              AppSizeBox.md,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Projects',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h2,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.md, bottom: AppSize.lg),
                child: SizedBox(
                  width: constriant.maxWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.from(
                        controller.taskController.projects.map(
                          (each) => Obx(
                            () {
                              return ProjectCard(
                                callback: () => controller.updateActiveProject(each.id),
                                project: each,
                                active: controller.activeProject.value == null
                                    ? false
                                    : controller.activeProject.value!.id == each.id,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => TaskTable(
                  rows: controller.taskRows.value,
                ),
              ),
              Padding(
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
            ],
          );
        },
      ),
    );
  }
}
