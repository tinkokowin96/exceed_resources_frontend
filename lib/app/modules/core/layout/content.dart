import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  final Widget child;
  const AppContent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: child);
  }
}
