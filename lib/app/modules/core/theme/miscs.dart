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
    required EInputStyle style,
    String? hintText,
    String? suffix,
    TextStyle? hintStyle,
  }) =>
      InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.all(style == EInputStyle.message ? AppSize.mP : AppSize.fP),
        hintText: hintText,
        filled: style == EInputStyle.line ? false : true,
        fillColor: style == EInputStyle.primary
            ? AppTheme.of(context).color.secondary.withOpacity(0.1)
            : style == EInputStyle.message
                ? Colors.transparent
                : null,
        suffix: suffix != null
            ? ColoredBox(
                color: AppTheme.of(context).color.secondary.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.sm),
                  child: Text(
                    suffix,
                    style: AppTheme.text(
                      size: EText.h4,
                      context: context,
                      type: ETextType.primary,
                    ),
                  ),
                ),
              )
            : AppSizeBox.zero,
        hintStyle: hintStyle ??
            AppTheme.text(
              context: context,
              weight: FontWeight.w500,
            ).copyWith(
              color:
                  style == EInputStyle.primary ? AppTheme.of(context).color.secondary.withOpacity(0.7) : Colors.black,
            ),
        enabledBorder: style == EInputStyle.line
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(style == EInputStyle.message ? AppSize.md : 0),
                borderSide: BorderSide(
                  color: style == EInputStyle.message
                      ? AppTheme.of(context).color.idle.withOpacity(0.1)
                      : AppTheme.of(context).color.secondary.withOpacity(0.2),
                ),
              ),
        focusedBorder: style == EInputStyle.line
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).color.secondary,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(style == EInputStyle.message ? AppSize.md : 0),
                borderSide: BorderSide(
                  color: style == EInputStyle.message
                      ? AppTheme.of(context).color.idle.withOpacity(0.3)
                      : AppTheme.of(context).color.secondary,
                ),
              ),
      );
}
