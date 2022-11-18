import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppThemeMiscs {
  static final shadow1 = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 1,
    blurRadius: 10,
  );

  static final shadow2 = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 10,
  );

  static inputStyle({
    required BuildContext context,
    EInputStyle style = EInputStyle.primary,
    EInputColor color = EInputColor.primary,
    EInputColor border = EInputColor.primary,
    double borderRadius = AppSize.xs,
    String? hintText,
    String? suffix,
    TextStyle? hintStyle,
  }) =>
      InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(AppSize.fep),
        hintText: hintText,
        filled: style == EInputStyle.line ? false : true,
        fillColor: color == EInputColor.primary
            ? AppTheme.of(context).color.secondary.withOpacity(0.05)
            : color == EInputColor.transparent
                ? Colors.transparent
                : color == EInputColor.background
                    ? Colors.white
                    : null,
        suffixIcon: suffix != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    suffix,
                    textAlign: TextAlign.center,
                    style: AppTheme.text(
                      size: EText.h4,
                      context: context,
                      type: ETextType.category,
                    ),
                  ),
                ],
              )
            : AppSizeBox.zero,
        hintStyle: hintStyle ??
            AppTheme.text(context: context, weight: FontWeight.w500).copyWith(
              color: style == EInputStyle.primary
                  ? AppTheme.of(context).color.secondary.withOpacity(0.7)
                  : AppTheme.of(context).color.idle,
            ),
        enabledBorder: style == EInputStyle.line
            ? UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.of(context).color.idle))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: border == EInputColor.primary
                      ? AppTheme.of(context).color.secondary.withOpacity(0.15)
                      : AppTheme.of(context).color.idle.withOpacity(0.15),
                ),
              ),
        focusedBorder: style == EInputStyle.line
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).color.secondary,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: border == EInputColor.primary
                      ? AppTheme.of(context).color.secondary.withOpacity(0.3)
                      : AppTheme.of(context).color.idle.withOpacity(0.3),
                ),
              ),
      );
}
