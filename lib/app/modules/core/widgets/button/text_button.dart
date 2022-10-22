import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final ESize size;
  final ETextType? style;
  final bool disabled;

  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
    this.size = ESize.md,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTheme.text(
      context: context,
      type: style ?? (disabled ? ETextType.disabled : ETextType.primary),
      weight: FontWeight.w500,
    );

    switch (size) {
      case ESize.sm:
        textStyle = textStyle.copyWith(fontSize: getFontSize(EText.h4, context));
        break;
      case ESize.lg:
        textStyle = textStyle.copyWith(fontSize: getFontSize(EText.h2, context));
        break;
      default:
    }

    return TextButton(
      onPressed: () => disabled ? null : onPressed(),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          disabled ? Colors.transparent : AppTheme.of(context).color.secondary.withOpacity(0.2),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
