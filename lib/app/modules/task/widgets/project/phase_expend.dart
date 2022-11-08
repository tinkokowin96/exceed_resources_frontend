import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/add_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/item_button.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhaseExpand extends GetView<ProjectController> {
  const PhaseExpand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: LayoutBuilder(
        builder: (context, constriant) {
          return SizedBox(
            width: constriant.maxWidth,
            child: Wrap(
              spacing: AppSize.md,
              runSpacing: AppSize.sm,
              children: [
                AddButton(
                  onPressed: () => controller.updateExpandable(
                    type: 'phase',
                    expandable: EExpandable.form,
                  ),
                ),
                ItemButton(text: 'Phase 1', onPressed: () {}),
                ItemButton(text: 'Phase 2', onPressed: () {}),
                ItemButton(text: 'Phase 3', onPressed: () {}),
              ],
            ),
          );
        },
      ),
    );
  }
}
