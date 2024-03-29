import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/add_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/item_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/phase_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class PhaseForm extends GetView<PhaseFormController> {
  const PhaseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PhaseFormController());
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            key: controller.formKey,
            child: AppColumn(
              spacing: AppSize.md,
              children: [
                TextFormField(
                  decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'Phase Name *'),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'Start Date *'),
                      ),
                    ),
                    AppSizeBox.sm,
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'End Date  *'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collaborators',
                      style: AppTheme.text(context: context, weight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: SizedBox(
                        width: constraint.maxWidth,
                        child: Wrap(
                          spacing: AppSize.sm,
                          children: [
                            AddButton(onPressed: () {}),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.abtn / 2),
                              child: Image.asset(
                                'assets/images/emp.jpg',
                                width: AppSize.abtn,
                                height: AppSize.abtn,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.abtn / 2),
                              child: Image.asset(
                                'assets/images/emp.jpg',
                                width: AppSize.abtn,
                                height: AppSize.abtn,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.abtn / 2),
                              child: Image.asset(
                                'assets/images/emp.jpg',
                                width: AppSize.abtn,
                                height: AppSize.abtn,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.abtn / 2),
                              child: Image.asset(
                                'assets/images/emp.jpg',
                                width: AppSize.abtn,
                                height: AppSize.abtn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MRoles',
                      style: AppTheme.text(context: context, weight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: SizedBox(
                        width: constraint.maxWidth,
                        child: Wrap(
                          spacing: AppSize.sm,
                          runSpacing: AppSize.sm,
                          children: [
                            AddButton(onPressed: () {}),
                            ItemButton(text: 'Design', onPressed: () {}),
                            ItemButton(text: 'Webfront', onPressed: () {}),
                            ItemButton(text: 'Backend', onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'Remark'),
                  maxLines: 6,
                ),
                Column(
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
                AppButton(
                  onPressed: () {},
                  text: 'Create',
                  disabled: true,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
