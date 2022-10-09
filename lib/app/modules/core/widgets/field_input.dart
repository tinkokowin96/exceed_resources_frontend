import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? placeholder;
  final double? width;
  final ESize? size;

  const AppFieldInput({
    Key? key,
    required this.controller,
    this.placeholder,
    this.width,
    this.label,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? AppSize.fWMd(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            label != null
                ? Padding(
                    padding: const EdgeInsets.only(right: AppSize.sm),
                    child: Text(
                      label!,
                      style: AppTheme.text(
                        context: context,
                        weight: FontWeight.w500,
                        size: size == ESize.sm ? EText.h4 : EText.h3,
                      ),
                    ),
                  )
                : AppSizeBox.zero,
            Expanded(
              child: TextField(
                style: AppTheme.text(
                  context: context,
                  size: size == ESize.sm ? EText.h4 : EText.h3,
                ),
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: AppSize.sm),
                  isCollapsed: true,
                  hintText: placeholder,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.of(context).color.idle),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.of(context).color.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
