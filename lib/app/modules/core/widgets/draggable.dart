import 'package:flutter/material.dart';

class AppDraggable extends StatelessWidget {
  final dynamic item;
  final Function(dynamic old, dynamic dropped) onDropped;
  const AppDraggable({
    Key? key,
    required this.item,
    required this.onDropped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onAccept: (data) => onDropped(data, item),
      builder: (context, candidateData, rejectedData) {
        return LongPressDraggable(
          data: item,
          feedback: Opacity(opacity: 0.5, child: item.child),
          child: item.child,
        );
      },
    );
  }
}
