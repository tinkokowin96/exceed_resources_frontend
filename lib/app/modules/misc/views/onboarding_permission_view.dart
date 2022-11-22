import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_listing_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_permission_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_listing.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/onboarding/onboarding_permission_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPermissionView extends GetView<OnboardingPermissionController> {
  const OnboardingPermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Onboarding Permission',
      backAction: () => Get.delete<ColleagueListingController>(),
      headerTail: AppTextButton(onPressed: () {}, text: 'Save', size: EText.h2),
      content: Obx(
        () {
          return Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: App.height(context) * 0.4),
                child: Wrap(
                  spacing: AppSize.sm,
                  runSpacing: AppSize.sm,
                  children: List.from(
                    controller.permissions.value.map(
                      (each) => OnboardingPermissionCard(
                        data: each.text,
                        onDelete: () => controller.removePermission(each.value),
                      ),
                    ),
                  ),
                ),
              ),
              ColleagueListing(
                selectedColleagues: controller.selectedColleagues.value,
                remainingColleagues: controller.remainingColleagues.value,
                padding: AppSize.lg,
                exportable: true,
                showSalary: true,
                onAdd: ({colleague, departmentId}) => controller.updateColleague(
                  colleague: colleague,
                  departmentId: departmentId,
                ),
                onRemove: ({colleague, departmentId}) => controller.updateColleague(
                  add: false,
                  colleague: colleague,
                  departmentId: departmentId,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
