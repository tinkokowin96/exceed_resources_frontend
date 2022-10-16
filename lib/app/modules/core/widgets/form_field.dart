import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFromField extends StatelessWidget {
  final double width;
  final bool readOnly;
  final bool obscureText;
  final EInputStyle style;
  final TextEditingController? controller;
  final TextStyle? inputStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? value;
  final List<TextInputFormatter>? inputFormat;
  final String? suffix;
  final FocusNode? focusNode;
  final String? title;
  final TextStyle? titleStyle;
  final String? Function(String? value)? validator;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final Function(bool hasFocus)? onFocusChange;

  const AppFromField({
    Key? key,
    required this.width,
    this.obscureText = false,
    this.readOnly = false,
    this.style = EInputStyle.line,
    this.inputStyle,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.value,
    this.inputFormat,
    this.focusNode,
    this.suffix,
    this.title,
    this.titleStyle,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFocusChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? Text(title!, style: titleStyle ?? AppTheme.text(context: context)) : AppSizeBox.zero,
        Column(
          children: [
            SizedBox(
              width: width,
              height: AppSize.fHMd,
              child: Focus(
                onFocusChange: ((bool hasFocus) => onFocusChange != null ? onFocusChange!(hasFocus) : null),
                child: TextFormField(
                  readOnly: readOnly,
                  obscureText: obscureText,
                  controller: controller,
                  initialValue: value,
                  inputFormatters: inputFormat,
                  focusNode: focusNode,
                  onTap: onTap,
                  style: inputStyle ??
                      AppTheme.text(
                        context: context,
                        type: style == EInputStyle.primary ? ETextType.primary : ETextType.body,
                        weight: FontWeight.w500,
                      ),
                  decoration: AppThemeMiscs.inputStyle(
                    context: context,
                    style: style,
                    hintText: hintText,
                    hintStyle: hintStyle,
                    suffix: suffix,
                  ),
                  onChanged: onChanged,
                  validator: validator,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
