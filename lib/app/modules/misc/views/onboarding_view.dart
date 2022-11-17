import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
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
      content: Column(
        children: [
          Obx(
            () => SectionHeading(
              sections: const ['All', 'Video', 'Image', 'PDF', 'Article'],
              prevIndex: controller.prevIndex.value,
              activeIndex: controller.activeIndex.value,
              updateIndex: controller.updateIndex,
            ),
          ),
        ],
      ),
    );
  }
}
