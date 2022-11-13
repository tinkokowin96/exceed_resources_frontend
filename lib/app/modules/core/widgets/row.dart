import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final bool firstNoSpacing;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double? endSpacing;
  const AppRow({
    Key? key,
    required this.children,
    required this.spacing,
    this.firstNoSpacing = true,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.endSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.from(
        children.asMap().entries.map(
          (each) {
            final isExpanded = each.value is Expanded || each.value is Obx;
            final noPadding = (firstNoSpacing && each.key == 0) || isExpanded;
            if (noPadding) {
              return each.value;
            }
            return Padding(
              padding: EdgeInsets.only(
                left: noPadding ? 0 : spacing,
                right: noPadding || endSpacing == null ? 0 : endSpacing!,
              ),
              child: each.value,
            );
          },
        ),
      ),
    );
  }
}
