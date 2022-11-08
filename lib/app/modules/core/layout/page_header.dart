import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final Function()? headerAction;
  final String? headerActionText;
  const PageHeader({
    Key? key,
    required this.title,
    this.headerAction,
    this.headerActionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.sm),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppAnimatedPress(
              onPressed: () => Get.back(),
              child: const Icon(Icons.navigate_before),
            ),
          ),
          Align(
            alignment: headerAction == null ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: headerAction == null ? 0 : AppSize.lg),
              child: Text(
                title,
                style: AppTheme.text(
                  context: context,
                  size: EText.h2,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ),
          headerAction == null
              ? AppSizeBox.zero
              : Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    text: headerActionText!,
                    onPressed: headerAction!,
                  ),
                )
        ],
      ),
    );
  }
}
