import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.sm),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.icoLg / 2),
            child: Image.asset(
              'assets/images/emp.jpg',
              width: AppSize.icoLg,
              height: AppSize.icoLg,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Moe Kyaw',
                      style: AppTheme.text(context: context),
                    ),
                    AppSizeBox.md,
                    Text(
                      'Frontend Developer',
                      style: AppTheme.text(
                        context: context,
                        type: ETextType.subtitle,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Moe Kyaw',
                      style: AppTheme.text(context: context),
                    ),
                    AppSizeBox.md,
                    Text(
                      'Frontend Developer',
                      style: AppTheme.text(
                        context: context,
                        type: ETextType.subtitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
