import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/switch_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool hasAdminMode;
  final AppController? controller;
  final Widget? headerTail;
  final Function()? backAction;
  const PageHeader({
    Key? key,
    required this.title,
    this.hasAdminMode = false,
    this.controller,
    this.headerTail,
    this.backAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.md),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppSize.sm),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppAnimatedPress(
                onPressed: () {
                  Get.back();
                  if (backAction != null) {
                    backAction!();
                  }
                },
                child: const Icon(Icons.navigate_before),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: App.width(context) * 0.6,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTheme.text(
                  context: context,
                  size: EText.h2,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (headerTail != null || hasAdminMode)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: AppSize.sm),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (headerTail != null) headerTail!,
                    if (hasAdminMode)
                      Obx(
                        () => AppSwitch(
                          data: MSwitch(
                            activeIcon: controller!.adminMode.isTrue ? Icons.supervisor_account : Icons.visibility,
                            idleIcon: controller!.adminMode.isTrue ? Icons.visibility : Icons.supervisor_account,
                          ),
                          active: controller!.adminMode.isTrue,
                          toggleSwitch: controller!.toggleMode,
                          activeBackground: AppTheme.of(context).color.secondary,
                          activeIconBackground: AppTheme.of(context).color.background,
                          activeIconColor: AppTheme.of(context).color.secondary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
