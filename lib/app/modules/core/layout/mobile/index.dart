import 'package:exceed_resources_frontend/app/modules/core/layout/content.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/header.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/navigation.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final EMenu currentMenu;
  final Widget content;
  final bool header;
  const MobileLayout({
    Key? key,
    required this.content,
    required this.currentMenu,
    this.header = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.md),
          child: Column(
            children: [
              header ? const AppHeader() : AppSizeBox.zero,
              AppContent(child: content),
              AppNavigation(
                currentMenu: currentMenu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
