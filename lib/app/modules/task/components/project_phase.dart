import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/phase_expend.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectPhase extends GetView<ProjectController> {
  const ProjectPhase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: AppTheme.of(context).color.container, borderRadius: BorderRadius.circular(AppSize.sm)),
      child: LayoutBuilder(
        builder: (context, constriant) => SizedBox(
          width: constriant.maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phase',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h2,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => controller.phase.value == EExpandable.expand
                              ? AppSizeBox.zero
                              : Text(
                                  '4 Phases',
                                  style: AppTheme.text(context: context),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSize.md),
                          child: IconButton(
                            onPressed: () => controller.updateExpandable(
                              type: 'phase',
                              expandable: controller.phase.value == EExpandable.expand
                                  ? EExpandable.minimize
                                  : EExpandable.expand,
                            ),
                            icon: Obx(
                              () => Icon(
                                controller.phase.value == EExpandable.expand ? Icons.expand_more : Icons.expand_less,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1.2, 0), end: const Offset(0, 0)).animate(animation),
                      child: child,
                    ),
                    child: controller.phase.value == EExpandable.expand ? const PhaseExpend() : AppSizeBox.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
