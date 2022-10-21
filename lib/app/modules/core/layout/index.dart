import 'package:exceed_resources_frontend/app/modules/core/layout/mobile/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLayout {
  static Widget core({
    required EMenu currentMenu,
    required Widget content,
    bool header = false,
    bool loading = false,
    Widget? popup,
    String? title,
  }) =>
      Layout(
        loading: loading,
        popup: popup,
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
    Widget? popup,
  }) =>
      Layout(
        loading: loading,
        popup: popup,
        child: content,
      );
}

class Layout extends StatelessWidget {
  final bool loading;
  final Widget child;
  final Widget? popup;
  const Layout({
    Key? key,
    required this.child,
    this.loading = false,
    this.popup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: popup != null || loading ? 0.5 : 1,
            child: AbsorbPointer(
              absorbing: popup != null || loading ? true : false,
              child: SafeArea(
                child: child,
              ),
            ),
          ),
          popup != null || loading
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: popup ?? Lottie.asset('assets/animation/loading.json'),
                )
              : AppSizeBox.zero
        ],
      ),
    );
  }
}
