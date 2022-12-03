import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/toggle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/upload_attachment.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateOnboardingAttachmentPopup extends GetView<OnboardingController> {
  const CreateOnboardingAttachmentPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return AppColumn(
        spacing: AppSize.md,
        children: [
          Text(
            'Create Onboarding Attachment',
            style: AppTheme.text(
              context: context,
              weight: FontWeight.w500,
              size: EText.h2,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.attachmentNameController,
                decoration: AppThemeMiscs.inputStyle(
                  context: context,
                  hintText: 'Name *',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.sm),
                child: Obx(
                  () {
                    final selectedIndex = controller.selectedCreateOnboarding.indexWhere((each) => each == true);
                    late final List<Widget> uploadAttachment = [];
                    if (selectedIndex == 0) {
                      uploadAttachment.add(
                        UploadAttachment(
                          width: constraint.maxWidth,
                          height: AppSize.imgfeH,
                          pickFile: (image) => null,
                          updateError: controller.updateError,
                        ),
                      );
                    } else {
                      uploadAttachment.addAll([
                        UploadAttachment(
                          key: ValueKey(selectedIndex.toString()),
                          type: selectedIndex == 1 ? EAttachment.video : EAttachment.pdf,
                          width: constraint.maxWidth,
                          height: AppSize.imgfeH,
                          pickFile: (image) => null,
                          updateError: controller.updateError,
                        ),
                        UploadAttachment(
                          type: EAttachment.thumbnail,
                          width: constraint.maxWidth,
                          height: AppSize.imgfeH,
                          pickFile: (image) => null,
                          updateError: controller.updateError,
                        ),
                      ]);
                    }
                    return AppColumn(
                      spacing: AppSize.sm,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppToggle(
                            isSelected: controller.selectedCreateOnboarding,
                            onSelectionChange: controller.changeOnbardingType,
                            disabled: const [],
                            children: controller.attachmentTypes,
                          ),
                        ),
                        ...uploadAttachment,
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
