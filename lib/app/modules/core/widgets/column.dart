import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final bool firstNoSpacing;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  const AppColumn({
    Key? key,
    required this.children,
    required this.spacing,
    this.firstNoSpacing = true,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: List.from(
        children.asMap().entries.map(
              (each) => Padding(
                padding: EdgeInsets.only(top: firstNoSpacing && each.key == 0 ? 0 : spacing),
                child: each.value,
              ),
            ),
      ),
    );
  }
}
