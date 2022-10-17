import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/quotation_expend.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/quotation_form.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/quotation_minimize.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectQuotation extends GetView<ProjectController> {
  final double maxWidth;
  const ProjectQuotation({
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
                    'Quotations',
                    style: AppTheme.text(
                      context: context,
                      size: EText.h2,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () => controller.updateExpandable(
                        type: 'quotation',
                        expandable: controller.quotation.value == EExpandable.expand
                            ? EExpandable.minimize
                            : EExpandable.expand,
                      ),
                      child: Icon(
                        controller.quotation.value == EExpandable.expand
                            ? Icons.expand_more
                            : controller.quotation.value == EExpandable.minimize
                                ? Icons.expand_less
                                : Icons.navigate_before,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => SlideTransition(
                      position: Tween<Offset>(begin: const Offset(1.2, 0), end: const Offset(0, 0)).animate(animation),
                      child: child,
                    ),
                    child: controller.quotation.value == EExpandable.expand
                        ? const QuotationExpend(
                            key: ValueKey('quotation_expend'),
                          )
                        : controller.quotation.value == EExpandable.minimize
                            ? const QuotationMinimize(
                                key: ValueKey('quotation_less'),
                              )
                            : const QuotationForm(
                                key: ValueKey('quotation_form'),
                              ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
