import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
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
import 'package:exceed_resources_frontend/app/modules/core/widgets/video_player.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/onboarding_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      noPadding: true,
      title: 'On Boarding',
      hasAdminMode: true,
      content: Obx(
        () {
          final adminMode = controller.adminMode.value;
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
                                    if (!adminMode)
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
                                              child: SizedBox(
                                                width: App.cardSize(context: context, numCol: 3),
                                                height: App.cardSize(context: context, numCol: 3),
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
                                              image: image,
                                              name: name,
                                              category: type,
                                              selected: controller.adminMode.value
                                                  ? controller.selectedOnboardings.value[each.id] != null
                                                  : null,
                                              onChanged: controller.adminMode.value
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
                                                      arguments: AppVideoPlayer(
                                                        url: each.attachment!.url,
                                                        homeRoute: MiscRoutes.onboarding,
                                                        controller: controller,
                                                        playerController: controller.playerController,
                                                        chewieController: controller.chewieController,
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
                  if (selectedNotEmpty && adminMode) {
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
