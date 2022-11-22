import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool disabled;
  final EText size;

  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
    this.size = EText.h3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => disabled ? null : onPressed(),
      child: Text(
        text,
        style: AppTheme.text(
          context: context,
          size: size,
          weight: FontWeight.w500,
          type: disabled ? ETextType.disabled : ETextType.primary,
        ),
      ),
    );
  }
}
