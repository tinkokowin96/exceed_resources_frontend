import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_switcher.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/onboarding/onboarding_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      noPadding: true,
      title: 'On Boarding',
      content: Obx(
        () {
          return AppColumn(
            spacing: AppSize.md,
            mainAxisSize: MainAxisSize.max,
            children: [
              SectionHeading(
                sections: const ['All', 'Video', 'Image', 'PDF', 'Article'],
                prevIndex: controller.prevIndex.value,
                activeIndex: controller.activeIndex.value,
                updateIndex: controller.updateIndex,
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, constraint) {
                  return AppAnimatedSwitcher(
                    child: Padding(
                      key: ValueKey(controller.activeIndex.toString()),
                      padding: const EdgeInsets.all(AppSize.sm),
                      child: SizedBox(
                        width: constraint.maxWidth,
                        child: Align(
                          alignment: controller.data.length > 1 ? Alignment.topCenter : Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: AppSize.sm,
                              runSpacing: AppSize.sm,
                              children: List.from(
                                controller.data.map(
                                  (each) => OnboardingItemCard(data: each),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          );
        },
      ),
    );
  }
}
