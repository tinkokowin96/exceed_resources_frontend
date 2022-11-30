import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPermissionCard extends StatelessWidget {
  final String data;
  final Function() onDelete;
  const OnboardingPermissionCard({
    Key? key,
    required this.data,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppContainer(
          width: App.cardSize(context: context, numCol: 3),
          height: AppSize.cardH,
          noBorder: false,
          child: Center(
            child: Text(
              data,
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: AppAnimatedPress(
            onPressed: onDelete,
            child: SvgPicture.asset(
              'assets/icons/remove.svg',
              width: AppSize.icoSm,
            ),
          ),
        )
      ],
    );
  }
}
