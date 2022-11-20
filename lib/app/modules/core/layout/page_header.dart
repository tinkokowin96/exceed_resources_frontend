import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final Widget? headerTail;
  final Function()? backAction;
  const PageHeader({
    Key? key,
    required this.title,
    this.headerTail,
    this.backAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.sm, bottom: AppSize.md),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppSize.sm),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppAnimatedPress(
                onPressed: () {
                  Get.back();
                  if (backAction != null) {
                    backAction!();
                  }
                },
                child: const Icon(Icons.navigate_before),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: App.width(context) * 0.6,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTheme.text(
                  context: context,
                  size: EText.h2,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (headerTail != null)
            Padding(
              padding: const EdgeInsets.only(right: AppSize.sm),
              child: Align(alignment: Alignment.centerRight, child: headerTail!),
            )
        ],
      ),
    );
  }
}
