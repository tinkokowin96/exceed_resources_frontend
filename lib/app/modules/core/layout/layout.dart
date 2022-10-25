import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/mobile_layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/drawer.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLayout {
  static Widget core({
    required EMenu currentMenu,
    required Widget content,
    AppController? controller,
    bool header = false,
    bool loading = false,
    AppPopup? popup,
    AppDrawer? drawer,
    String? title,
  }) =>
      Layout(
        loading: loading,
        popup: popup,
        drawer: drawer,
        controller: controller,
        child: MobileLayout(
          currentMenu: currentMenu,
          content: content,
          header: header,
          title: title,
        ),
      );

  static Widget fullscreen({
    required Widget content,
    bool loading = false,
    AppPopup? popup,
    AppDrawer? drawer,
  }) =>
      Layout(
        loading: loading,
        popup: popup,
        drawer: drawer,
        child: content,
      );
}

class Layout extends StatelessWidget {
  final bool loading;
  final Widget child;
  final AppController? controller;
  final AppPopup? popup;
  final AppDrawer? drawer;
  const Layout({
    Key? key,
    required this.child,
    this.loading = false,
    this.controller,
    this.popup,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: popup != null || drawer != null || loading ? 0.5 : 1,
            child: GestureDetector(
              onTap: drawer != null ? controller!.exitDrawerRequest : null,
              child: AbsorbPointer(
                absorbing: popup != null || drawer != null || loading ? true : false,
                child: SafeArea(
                  child: child,
                ),
              ),
            ),
          ),
          popup != null || loading
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: popup ?? Lottie.asset('assets/animation/loading.json'),
                )
              : AppSizeBox.zero,
          drawer != null
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  child: drawer!,
                )
              : AppSizeBox.zero,
        ],
      ),
    );
  }
}
