import 'package:exceed_resources_frontend/app/modules/core/layout/mobile/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLayout extends StatelessWidget {
  final EMenu currentMenu;
  final bool header;
  final String? title;
  final Widget content;
  final bool loading;
  const AppLayout({
    Key? key,
    required this.currentMenu,
    required this.content,
    this.title,
    this.header = false,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: loading ? 0.5 : 1,
          child: AbsorbPointer(
            absorbing: loading,
            child: MobileLayout(
              currentMenu: currentMenu,
              content: content,
              header: header,
              title: title,
            ),
          ),
        ),
        loading ? Lottie.asset('assets/animation/loading.json') : AppSizeBox.zero,
      ],
    );
  }
}
