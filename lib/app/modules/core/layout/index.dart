import 'package:exceed_resources_frontend/app/modules/core/layout/mobile/index.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final bool noHeader;
  const AppLayout({Key? key, this.noHeader = true}) : super(key: key);

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
      noHeader: noHeader,
    );
  }
}
