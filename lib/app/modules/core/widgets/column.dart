import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppColumn extends StatelessWidget {
  final double spacing;
  final List<Widget> children;
  final bool firstNoSpacing;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double? endSpacing;
  const AppColumn({
    Key? key,
    required this.spacing,
    required this.children,
    this.firstNoSpacing = true,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.endSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.from(
        children.asMap().entries.map(
          (each) {
            final isExpanded = each.value is Expanded || each.value is Obx || each.value is Padding;
            final noPadding = (firstNoSpacing && each.key == 0) || isExpanded;
            if (noPadding) {
              return each.value;
            }
            return Padding(
              padding: EdgeInsets.only(
                top: noPadding ? 0 : spacing,
                bottom: noPadding || endSpacing == null ? 0 : endSpacing!,
              ),
              child: each.value,
            );
          },
        ),
      ),
    );
  }
}
