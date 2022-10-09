import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorView extends StatelessWidget {
  final String error;
  const ErrorView({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/error_page.svg',
            width: App.width(context),
          ),
          AppSizeBox.md,
          Text(
            error,
            textAlign: TextAlign.center,
            style: AppTheme.text(
              context: context,
              type: ETextType.error,
              size: EText.h1,
              weight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
