import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RemovableItem extends StatelessWidget {
  final Function() onRemove;
  final Widget child;
  const RemovableItem({
    Key? key,
    required this.onRemove,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          child: AppAnimatedPress(
            onPressed: onRemove,
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
