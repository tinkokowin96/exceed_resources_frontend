import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup/popup.dart';
import 'package:flutter/material.dart';

class InfoPopup extends StatelessWidget {
  final String info;
  final String title;
  final AppController controller;
  const InfoPopup({
    Key? key,
    required this.info,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPopup(
      controller: controller,
      cancel: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTheme.text(
              context: context,
              weight: FontWeight.w500,
              size: EText.h2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.sm),
            child: Text(
              info,
              textAlign: TextAlign.center,
              style: AppTheme.text(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
