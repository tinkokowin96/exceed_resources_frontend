import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Size size;
  final String text;
  final bool disabled;
  final EButtonStyle style;
  final TextStyle? buttonTextStyle;
  final Function() onPressed;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.style = EButtonStyle.def,
    this.disabled = false,
    this.buttonTextStyle,
    this.size = const Size(AppSize.btnWMd, AppSize.btnHMd),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.height),
            ),
          ),
          fixedSize: MaterialStateProperty.all(size),
          backgroundColor: MaterialStateProperty.all(
            style == EButtonStyle.def
                ? AppTheme.of(context).color.container
                : AppTheme.of(context).color.primary.withOpacity(0.1),
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Center(
          child: Text(
            text,
            style: buttonTextStyle ??
                AppTheme.text(
                  context: context,
                  type: disabled
                      ? (style == EButtonStyle.def ? ETextType.disabled : ETextType.disabledPrimary)
                      : (style == EButtonStyle.def ? ETextType.subtitle : ETextType.primary),
                  weight: FontWeight.w500,
                ),
          ),
        ),
      );
}
