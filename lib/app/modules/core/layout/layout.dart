import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/mobile_layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class AppLayout {
  static Widget core({
    required EMenu currentMenu,
    required AppController controller,
    required Widget content,
    double? topPadding,
    bool noPadding = false,
    bool header = false,
    bool hasAdminMode = false,
    Function()? containerAction,
    String? title,
    Widget? headerTail,
    Function()? backAction,
  }) =>
      Layout(
        containerAction: containerAction,
        controller: controller,
        child: MobileLayout(
          noPadding: noPadding,
          currentMenu: currentMenu,
          content: content,
          header: header,
          hasAdminMode: hasAdminMode,
          controller: controller,
          title: title,
          headerTail: headerTail,
          topPadding: topPadding,
          backAction: backAction,
        ),
      );

  static Widget fullscreen({
    required String title,
    required AppController controller,
    required Widget content,
    bool hasAdminMode = false,
    bool bottomSafeArea = true,
    Widget? headerTail,
    Function()? backAction,
    Function()? containerAction,
  }) =>
      Layout(
        containerAction: containerAction,
        controller: controller,
        bottomSafeArea: bottomSafeArea,
        child: Column(
          children: [
            PageHeader(
              title: title,
              headerTail: headerTail,
              backAction: backAction,
              hasAdminMode: hasAdminMode,
              controller: controller,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: AppSize.sm),
                child: content,
              ),
            )
          ],
        ),
      );
}

class Layout extends StatelessWidget {
  final Widget child;
  final Function()? containerAction;
  final AppController controller;
  final bool bottomSafeArea;
  const Layout({
    Key? key,
    required this.child,
    required this.controller,
    this.containerAction,
    this.bottomSafeArea = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Stack(
            children: [
              Opacity(
                opacity: controller.popup.value != null || controller.drawer.value != null || controller.loading.value
                    ? 0.5
                    : 1,
                child: GestureDetector(
                  onTap: controller.drawer.value != null ? controller.exitDrawerRequest : containerAction,
                  child: AbsorbPointer(
                    absorbing:
                        controller.popup.value != null || controller.drawer.value != null || controller.loading.value
                            ? true
                            : false,
                    child: SafeArea(
                      bottom: bottomSafeArea,
                      child: child,
                    ),
                  ),
                ),
              ),
              controller.popup.value != null || controller.loading.value
                  ? SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: controller.popup.value ?? Lottie.asset('assets/animation/loading.json'),
                    )
                  : AppSizeBox.zero,
              controller.drawer.value != null
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      child: controller.drawer.value!,
                    )
                  : AppSizeBox.zero,
            ],
          );
        },
      ),
    );
  }
}
