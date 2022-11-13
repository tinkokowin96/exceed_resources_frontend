import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AppToggle extends StatelessWidget {
  final List<Widget> children;
  final List<int> disabled;
  final List<bool> isSelected;
  final Function(int index) onSelectionChange;
  const AppToggle({
    Key? key,
    required this.children,
    required this.isSelected,
    required this.onSelectionChange,
    required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.lg,
      child: ToggleButtons(
        onPressed: (index) => disabled.contains(index) ? null : onSelectionChange(index),
        isSelected: isSelected,
        selectedBorderColor: AppTheme.of(context).color.secondary,
        fillColor: AppTheme.of(context).color.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSize.lg / 2),
        splashColor: AppTheme.of(context).color.secondary.withOpacity(0.4),
        children: children,
      ),
    );
  }
}
