import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/onboarding.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/onboarding/create_onboarding_attachment_popup.dart';
import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends AppController with AttachmentMixin {
  final data = m_onbardings.obs;
  final activeIndex = 0.obs;
  final prevIndex = 0.obs;
  final createArticleFormKey = GlobalKey<FormState>();
  final attachmentNameController = TextEditingController();
  final selectedOnboardings = Rx<Map<String, String?>>({});
  final attachmentTypes = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
      child: Text('Image', style: AppTheme.text(context: Get.context!)),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
      child: Text('Video', style: AppTheme.text(context: Get.context!)),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
      child: Text('PDF', style: AppTheme.text(context: Get.context!)),
    ),
  ];

  late final selectedCreateOnboarding = [true, false, false].obs;

  void updateIndex(int index) {
    prevIndex.value = activeIndex.value;
    activeIndex.value = index;
    switch (index) {
      case 0:
        data.value = m_onbardings;
        break;
      case 1:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.video,
          ),
        );
        break;
      case 2:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.image,
          ),
        );
        break;
      case 3:
        data.value = List.from(
          m_onbardings.where(
            (each) => each.attachment != null && each.attachment!.type == EAttachment.pdf,
          ),
        );
        break;
      case 4:
        data.value = List.from(m_onbardings.where((each) => each.article != null));
        break;
      default:
    }
    prevIndex.refresh();
    activeIndex.refresh();
    data.refresh();
  }

  void createOnboarding() {
    if (activeIndex.value == 4) {
      Get.toNamed(MiscRoutes.createArticle);
    } else {
      if (activeIndex.value > 0) {
        changeOnbardingType(activeIndex.value - 1);
      }
      showPopup(
        popupWidget: AppPopup(
          controller: this,
          child: const CreateOnboardingAttachmentPopup(),
        ),
      );
    }
  }

  void changeOnbardingType(int index) {
    selectedCreateOnboarding.value = List.from(
      attachmentTypes.asMap().entries.map((each) => each.key == index ? true : false),
    );
    selectedCreateOnboarding.refresh();
  }

  void updateOnboardingSelect(String id, bool? value, String? name) {
    if (value != null) {
      selectedOnboardings.value[id] = name;
      selectedOnboardings.refresh();
    }
  }

  void updatePermission() {
    Get.toNamed(
      MiscRoutes.onboardingPermission,
      arguments: List.from(
        selectedOnboardings.value.entries.where((each) => each.value != null).map(
              (item) => MOption(text: item.value!, value: item.key),
            ),
      ),
    );
  }

  @override
  void onInit() {
    for (final onboarding in m_onbardings) {
      selectedOnboardings.value[onboarding.id] = null;
    }
    selectedOnboardings.refresh();
    super.onInit();
  }
}
