import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool selected;
  final Function(bool?) onChanged;
  const AppCheckbox({
    Key? key,
    required this.selected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.md,
      height: AppSize.md,
      child: Checkbox(
        value: selected,
        onChanged: onChanged,
        fillColor: MaterialStateProperty.all<Color>(
          AppTheme.of(context).color.secondary,
        ),
      ),
    );
  }
}
