import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Moe Kyaw',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.text(
                                context: context,
                                size: EText.h2,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Frontend Developer ',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.text(
                                context: context,
                                size: EText.h2,
                                type: ETextType.subtitle,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/icons/notification_idle.svg',
                width: AppSize.icoMd,
                height: AppSize.icoMd,
                color: AppTheme.of(context).color.idle,
              ),
            ],
          ),
          AppSizeBox.md,
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: '5/12',
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.primary,
                    size: EText.h4,
                  ),
                  children: [
                    TextSpan(
                      text: '  L',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ),
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
                    size: EText.h4,
                    type: ETextType.primary,
                  ),
                  children: [
                    TextSpan(
                      text: ' T',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ),
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
                    size: EText.h4,
                    type: ETextType.error,
                  ),
                  children: [
                    TextSpan(
                      text: '  O',
                      style: AppTheme.text(
                        context: context,
                        size: EText.h4,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: AppSize.icoSm,
                      ),
                      AppSizeBox.xs,
                      Text(
                        '0:45:30',
                        style: AppTheme.text(
                          context: context,
                          size: EText.h4,
                        ),
                      ),
                      AppSizeBox.sm,
                      Flexible(
                        child: Text(
                          '(Monthly Sync Meeting)',
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.text(
                            context: context,
                            size: EText.h4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
