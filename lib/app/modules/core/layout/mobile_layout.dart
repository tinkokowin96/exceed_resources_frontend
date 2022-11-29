import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/content.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/user_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/navigation.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final EMenu currentMenu;
  final Widget content;
  final bool header;
  final bool noPadding;
  final bool hasAdminMode;
  final AppController controller;
  final double? topPadding;
  final String? title;
  final Widget? headerTail;
  final Function()? backAction;
  const MobileLayout({
    Key? key,
    required this.content,
    required this.currentMenu,
    required this.header,
    required this.noPadding,
    required this.hasAdminMode,
    required this.controller,
    this.topPadding,
    this.title,
    this.headerTail,
    this.backAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title != null
            ? PageHeader(
                title: title!,
                headerTail: headerTail,
                backAction: backAction,
                hasAdminMode: hasAdminMode,
                topPadding: topPadding,
                controller: controller,
              )
            : header
                ? const UserHeader()
                : AppSizeBox.zero,
        AppContent(noPadding: noPadding, child: content),
        AppNavigation(currentMenu: currentMenu),
      ],
    );
  }
}
