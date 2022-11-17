import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/mobile_layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/drawer.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class AppLayout {
  static Widget core({
    required EMenu currentMenu,
    required Widget content,
    required AppController controller,
    bool noPadding = false,
    Function()? containerAction,
    bool header = false,
    String? title,
    Widget? headerTail,
    Function()? headerAction,
    String? headerActionText,
  }) =>
      Layout(
        containerAction: containerAction,
        controller: controller,
        child: MobileLayout(
          noPadding: noPadding,
          currentMenu: currentMenu,
          content: content,
          header: header,
          title: title,
          headerTail: headerTail,
        ),
      );

  static Widget fullscreen({
    required Widget content,
    required AppController controller,
    bool loading = false,
    Function()? containerAction,
    AppPopup? popup,
    AppDrawer? drawer,
  }) =>
      Layout(
        containerAction: containerAction,
        controller: controller,
        child: content,
      );
}

class Layout extends StatelessWidget {
  final Widget child;
  final Function()? containerAction;
  final AppController controller;
  const Layout({
    Key? key,
    required this.child,
    required this.controller,
    this.containerAction,
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
                  onTap: controller.drawer.value != null ? controller.exitDrawerRequest : null,
                  child: AbsorbPointer(
                    absorbing:
                        controller.popup.value != null || controller.drawer.value != null || controller.loading.value
                            ? true
                            : false,
                    child: SafeArea(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: containerAction,
                        child: child,
                      ),
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
