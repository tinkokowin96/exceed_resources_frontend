import 'package:exceed_resources_frontend/app/modules/core/layout/mobile/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final EMenu currentMenu;
  final bool header;
  final Widget content;
  const AppLayout({
    Key? key,
    this.header = true,
    required this.currentMenu,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final device = getDevice(context);
    // switch (device) {
    //   case EDevice.mobile:
    //     return const MobileLayout();
    //   case EDevice.tablet:
    //     return const TabletLayout();
    //   default:
    //     return const DesktopLayout();
    // }
    return MobileLayout(
      currentMenu: currentMenu,
      content: content,
      header: header,
    );
  }
}
