import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_permission_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_permission/colleague_permission_card.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_permission/colleague_permission_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColleaguePermissionView extends GetView<ColleaguePermissionController> {
  const ColleaguePermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      controller: controller,
      currentMenu: EMenu.misc,
      title: 'Colleague Permission',
      content: SingleChildScrollView(
        child: AppColumn(
          spacing: AppSize.lg,
          children: [
            Wrap(
              spacing: AppSize.sm,
              runSpacing: AppSize.sm,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.from(
                controller.permissions.map(
                  (each) => Obx(
                    () => ColleaguePermissionCard(
                      permission: each,
                      selected: controller.selected.value != null && each.id == controller.selected.value!.id,
                      updateSelected: controller.updateSelected,
                    ),
                  ),
                ),
              ),
            ),
            AppColumn(
              spacing: AppSize.sm,
              children: [
                Text(
                  'Update Permission',
                  style: AppTheme.text(
                    context: context,
                    weight: FontWeight.w500,
                    type: ETextType.subtitle,
                  ),
                ),
                const ColleaguePermissionForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
