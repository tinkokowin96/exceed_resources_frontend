import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
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
            child: Padding(
              padding: const EdgeInsets.only(left: AppSize.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Moe Kyaw',
                            style: AppTheme.text(
                              context: context,
                              weight: FontWeight.w500,
                            ),
                          ),
                          AppSizeBox.sm,
                          Text(
                            'Frontend Developer',
                            style: AppTheme.text(
                              context: context,
                              type: ETextType.subtitle,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      AppSizeBox.sm,
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '5/12',
                              style: AppTheme.text(
                                context: context,
                                size: EText.h5,
                                type: ETextType.primary,
                              ),
                              children: [
                                TextSpan(
                                  text: '  Leave',
                                  style: AppTheme.text(context: context, size: EText.h5),
                                )
                              ],
                            ),
                          ),
                          AppSizeBox.sm,
                          RichText(
                            text: TextSpan(
                              text: '24',
                              style: AppTheme.text(
                                context: context,
                                size: EText.h5,
                                type: ETextType.primary,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Tasks',
                                  style: AppTheme.text(context: context, size: EText.h5),
                                )
                              ],
                            ),
                          ),
                          AppSizeBox.sm,
                          RichText(
                            text: TextSpan(
                              text: '12',
                              style: AppTheme.text(
                                context: context,
                                size: EText.h5,
                                type: ETextType.error,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Over Due Tasks',
                                  style: AppTheme.text(
                                    context: context,
                                    size: EText.h5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppSizeBox.sm,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: AppSize.icoSm,
                          ),
                          AppSizeBox.sm,
                          Text(
                            '0:45:30',
                            style: AppTheme.text(
                              context: context,
                              size: EText.h5,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/notification-idle.svg',
                    width: AppSize.icoMd,
                    color: AppTheme.of(context).color.idle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
