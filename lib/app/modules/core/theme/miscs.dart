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
        contentPadding: const EdgeInsets.all(AppSize.fP),
        hintText: hintText,
        filled: style == EInputStyle.primary ? true : false,
        fillColor: style == EInputStyle.primary ? AppTheme.of(context).color.secondary.withOpacity(0.1) : null,
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
                borderSide: BorderSide(
                  color: AppTheme.of(context).color.secondary.withOpacity(0.2),
                ),
              ),
        focusedBorder: style == EInputStyle.line
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).color.secondary,
                ),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).color.secondary,
                ),
              ),
      );
}
