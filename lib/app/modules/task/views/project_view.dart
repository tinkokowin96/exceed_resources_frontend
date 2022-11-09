import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project/project_phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project/project_quotation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      title: 'Create New Project',
      currentMenu: EMenu.task,
      controller: controller,
      content: Padding(
        padding: const EdgeInsets.only(top: AppSize.md),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraint.maxHeight),
              child: Column(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, formConstraint) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: formConstraint.maxHeight),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: AppSize.lg),
                              child: Form(
                                key: controller.formKey,
                                child: AppColumn(
                                  spacing: AppSize.md,
                                  children: [
                                    TextFormField(
                                      decoration: AppThemeMiscs.inputStyle(
                                        context: context,
                                        hintText: 'Project Name *',
                                      ),
                                    ),
                                    ProjectPhase(maxWidth: constraint.maxWidth),
                                    ProjectQuotation(maxWidth: constraint.maxWidth),
                                    SizedBox(
                                      width: constraint.maxWidth,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Resources ',
                                              style: AppTheme.text(context: context, weight: FontWeight.w500),
                                              children: const [
                                                TextSpan(text: '(up to 10 files with maximun of 5mb for each)'),
                                              ],
                                            ),
                                          ),
                                          Wrap(
                                            spacing: AppSize.sm,
                                            runSpacing: AppSize.sm,
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: [
                                              Text(
                                                'file-1.jpg',
                                                style: AppTheme.text(context: context),
                                              ),
                                              Text(
                                                'file-2.png',
                                                style: AppTheme.text(context: context),
                                              ),
                                              Text(
                                                'file-3.pdf',
                                                style: AppTheme.text(context: context),
                                              ),
                                              AppTextButton(text: 'Add', onPressed: () {}),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    AppButton(
                                      onPressed: () {},
                                      text: 'Create',
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
