import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  final Widget child;
  final bool noPadding;
  const AppContent({
    Key? key,
    required this.child,
    this.noPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding ? 0 : AppSize.md),
      child: child,
    ));
  }
}
