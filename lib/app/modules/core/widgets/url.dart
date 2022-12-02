import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUrl extends StatelessWidget {
  final String url;
  final String title;
  const AppUrl({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.webview,
        arguments: {
          'url': url,
          'title': title,
        },
      ),
      child: Text(
        url,
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(
          context: context,
          type: ETextType.subtitle,
        ).copyWith(
          fontFamily: 'Barlow Italic',
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
