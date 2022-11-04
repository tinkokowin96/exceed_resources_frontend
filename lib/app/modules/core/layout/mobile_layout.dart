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
  final String? title;
  final Function()? headerAction;
  final String? headerActionText;
  const MobileLayout({
    Key? key,
    required this.content,
    required this.currentMenu,
    required this.header,
    this.title,
    this.headerAction,
    this.headerActionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.md),
      child: Column(
        children: [
          title != null
              ? PageHeader(
                  title: title!,
                  headerAction: headerAction,
                  headerActionText: headerActionText,
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
