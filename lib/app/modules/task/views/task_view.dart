import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/paginator.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_table.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project_card.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final _controller = Get.find<TaskController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.activeProject.value = null;
      _controller.activeProject.refresh();
      _controller.tableController.resetTasks();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.task,
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
                    onPressed: () => Get.toNamed(AppRoutes.newProject),
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
                        _controller.tableController.projects.value.map(
                          (each) => Obx(
                            () {
                              return ProjectCard(
                                callback: () => _controller.updateActiveProject(each),
                                project: each,
                                active: _controller.activeProject.value == null
                                    ? false
                                    : _controller.activeProject.value!.id == each.id,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const TaskTable(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                child: Obx(
                  () {
                    return AppPaginator(
                      paginatedOptions: _controller.paginatedOptions,
                      callback: _controller.updatePage,
                      activePage: _controller.activePage.value,
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
