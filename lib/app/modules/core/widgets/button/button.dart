import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final TextStyle? buttonTextStyle;
  final Function() onPressed;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
    this.buttonTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.btnWMd))),
          minimumSize: MaterialStateProperty.all(const Size(AppSize.btnWMd, AppSize.btnHMd)),
          backgroundColor: MaterialStateProperty.all(AppTheme.of(context).color.primary.withOpacity(0.05)),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          text,
          style: buttonTextStyle ??
              AppTheme.text(
                context: context,
                type: disabled ? ETextType.disabled : ETextType.subtitle,
                weight: FontWeight.w500,
              ),
        ),
      );
}
