import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/phase_expend.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/phase_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectPhase extends GetView<ProjectController> {
  final double maxWidth;
  const ProjectPhase({
    Key? key,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: AppTheme.of(context).color.container, borderRadius: BorderRadius.circular(AppSize.sm)),
      child: SizedBox(
        width: maxWidth,
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
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.phase.value == EExpandable.minimize
                                ? Padding(
                                    padding: const EdgeInsets.only(right: AppSize.md),
                                    child: Text(
                                      '4 Phases',
                                      style: AppTheme.text(context: context),
                                    ),
                                  )
                                : AppSizeBox.zero,
                            InkWell(
                              onTap: () => controller.updateExpandable(
                                type: 'phase',
                                expandable: controller.phase.value == EExpandable.expand
                                    ? EExpandable.minimize
                                    : EExpandable.expand,
                              ),
                              child: Icon(
                                controller.phase.value == EExpandable.expand
                                    ? Icons.expand_more
                                    : controller.phase.value == EExpandable.minimize
                                        ? Icons.expand_less
                                        : Icons.navigate_before,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  child: controller.phase.value == EExpandable.expand
                      ? const PhaseExpend(
                          key: ValueKey('phase_expend'),
                        )
                      : controller.phase.value == EExpandable.form
                          ? const PhaseForm(
                              key: ValueKey('phase_form'),
                            )
                          : AppSizeBox.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
