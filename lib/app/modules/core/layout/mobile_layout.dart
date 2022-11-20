import 'package:exceed_resources_frontend/app/modules/core/layout/content.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/page_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/user_header.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/navigation.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final EMenu currentMenu;
  final Widget content;
  final bool header;
  final bool noPadding;
  final String? title;
  final Widget? headerTail;
  final Function()? backAction;
  const MobileLayout({
    Key? key,
    required this.content,
    required this.currentMenu,
    required this.header,
    required this.noPadding,
    this.title,
    this.headerTail,
    this.backAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding ? 0 : AppSize.md),
      child: Column(
        children: [
          title != null
              ? PageHeader(
                  title: title!,
                  headerTail: headerTail,
                  backAction: backAction,
                )
              : header
                  ? const UserHeader()
                  : AppSizeBox.zero,
          AppContent(child: content),
          AppNavigation(currentMenu: currentMenu),
        ],
      ),
    );
  }
}
