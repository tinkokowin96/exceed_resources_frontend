import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/removable_item.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_permission_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/position_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColleaguePermissionForm extends GetView<ColleaguePermissionController> {
  const ColleaguePermissionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      spacing: AppSize.sm,
      children: [
        ...List.from(
          controller.permission.keys.map(
            (each) {
              if (controller.permission[each]!.value is String) {
                return TextFormField(
                  controller: controller.nameController,
                  textAlignVertical: TextAlignVertical.center,
                  style: AppTheme.text(context: context),
                  decoration: AppThemeMiscs.inputStyle(
                    context: context,
                    hintText: '$each *',
                  ),
                );
              } else if (controller.permission[each]!.value is bool) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      each,
                      style: AppTheme.text(
                        context: context,
                        weight: FontWeight.w500,
                        type: ETextType.subtitle,
                      ),
                    ),
                    Obx(() {
                      return SizedBox(
                        width: AppSize.swiW,
                        height: AppSize.lg,
                        child: CupertinoSwitch(
                          activeColor: AppTheme.of(context).color.secondary,
                          value: controller.permission[each]!.value as bool,
                          onChanged: (value) => controller.updatePermissionSwitch(each, value),
                        ),
                      );
                    })
                  ],
                );
              } else if (each == 'For Positions' || each == 'For Departments') {
                return Obx(
                  () {
                    final positions = each == 'For Positions' && (controller.permission[each]!.value as List).isNotEmpty
                        ? controller.permission[each]!.value as List<MPosition>
                        : null;
                    final departments =
                        each == 'For Departments' && (controller.permission[each]!.value as List).isNotEmpty
                            ? controller.permission[each]!.value as List<MDepartment>
                            : null;
                    final items = positions ?? departments;

                    return Padding(
                      padding: const EdgeInsets.only(top: AppSize.sm),
                      child: AppContainer(
                        width: App.containerWidth(context),
                        background: AppTheme.of(context).color.background,
                        child: AppColumn(
                          spacing: AppSize.sm,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              each,
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                type: ETextType.subtitle,
                              ),
                            ),
                            AppDropdown(
                              items: controller.dropdownOptions,
                              dropdownController: each == 'For Positions'
                                  ? controller.forPositionController
                                  : controller.forDepartmentController,
                              defaultOption: controller.dropdownOptions[0],
                              onChanged: ({checked, value}) {},
                            ),
                            if (items != null)
                              Wrap(
                                spacing: AppSize.sm,
                                runSpacing: AppSize.sm,
                                children: List.from(
                                  items.map(
                                    (each) => RemovableItem(
                                      onRemove: () {},
                                      child: AppContainer(
                                        noBorder: false,
                                        child: Text(
                                          (each as dynamic).name,
                                          style: AppTheme.text(context: context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Padding(padding: EdgeInsets.all(0), child: AppSizeBox.zero);
              }
            },
          ),
        ),
        AppButton(onPressed: () {}, text: 'Save'),
      ],
    );
  }
}
