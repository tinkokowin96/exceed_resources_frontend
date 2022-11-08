import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ItemButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAnimatedPress(
      onPressed: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppTheme.of(context).color.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSize.lg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.sm),
          child: Text(
            text,
            style: AppTheme.text(
              context: context,
              type: ETextType.primary,
            ),
          ),
        ),
      ),
    );
  }
}
