import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/switch_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_switcher.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/image_card.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/switch.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      headerTail: Obx(
        () => AppSwitch(
          data: MSwitch(
            activeIcon: controller.permissionMode.isTrue ? Icons.supervisor_account : Icons.visibility,
            idleIcon: controller.permissionMode.isTrue ? Icons.visibility : Icons.supervisor_account,
          ),
          active: controller.permissionMode.isTrue,
          toggleSwitch: controller.toggleMode,
          activeBackground: AppTheme.of(context).color.secondary,
          activeIconBackground: AppTheme.of(context).color.background,
          activeIconColor: AppTheme.of(context).color.secondary,
        ),
      ),
      content: Obx(
        () {
          final permissionMode = controller.permissionMode.isTrue;
          return AppColumn(
            spacing: AppSize.md,
            mainAxisSize: MainAxisSize.max,
            children: [
              SectionHeading(
                sections: const ['All', 'Image', 'Video', 'PDF', 'Article'],
                prevIndex: controller.prevIndex.value,
                activeIndex: controller.activeIndex.value,
                updateIndex: controller.updateIndex,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraint) {
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
                                  children: [
                                    if (!permissionMode)
                                      AppAnimatedPress(
                                        onPressed: controller.createOnboarding,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(AppSize.xs),
                                                border: Border.all(color: AppTheme.of(context).color.secondary),
                                              ),
                                              child: const SizedBox(
                                                width: AppSize.cardWSm,
                                                height: AppSize.cardWSm,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/add.svg',
                                              width: AppSize.icoMd,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ...List.from(
                                      controller.data.map(
                                        (each) {
                                          final image = each.article != null
                                              ? each.article!.image
                                              : each.attachment!.type == EAttachment.image
                                                  ? each.attachment!.url
                                                  : each.attachment!.thumbnail;
                                          final type = each.article != null
                                              ? 'Article'
                                              : each.attachment!.type.name.firstCapitalize();
                                          final name =
                                              each.article != null ? each.article!.title : each.attachment!.name;
                                          return Obx(() {
                                            return ImageCard(
                                              image: image!,
                                              name: name,
                                              category: type,
                                              selected: controller.permissionMode.isTrue
                                                  ? controller.selectedOnboardings.value[each.id] != null
                                                  : null,
                                              onChanged: controller.permissionMode.isTrue
                                                  ? (value) => controller.updateOnboardingSelect(
                                                        each.id,
                                                        value,
                                                        value != null && value
                                                            ? each.attachment != null
                                                                ? each.attachment!.name
                                                                : each.article!.title
                                                            : null,
                                                      )
                                                  : null,
                                              onTap: () {
                                                if (each.attachment != null) {
                                                  if (each.attachment!.type == EAttachment.video) {
                                                    Get.toNamed(
                                                      AppRoutes.fullscreen,
                                                      arguments: SafeArea(
                                                        child: Column(
                                                          children: [
                                                            const PageHeader(title: ''),
                                                            Expanded(
                                                              child: Center(
                                                                child: SizedBox(
                                                                    width: App.width(context),
                                                                    height: AppSize.vpH,
                                                                    child: Chewie(
                                                                        controller: controller.getChewieController(
                                                                            each.attachment!.url!))),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    Get.toNamed(
                                                      AppRoutes.attachmentFullscreen,
                                                      arguments: each.attachment,
                                                    );
                                                  }
                                                } else {
                                                  Get.toNamed(MiscRoutes.article, arguments: each.article);
                                                }
                                              },
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Obx(
                () {
                  final selectedNotEmpty =
                      controller.selectedOnboardings.value.values.where((each) => each != null).isNotEmpty;
                  if (selectedNotEmpty && permissionMode) {
                    return AppButton(onPressed: controller.updatePermission, text: 'Update Permissions');
                  } else {
                    return AppSizeBox.zero;
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
