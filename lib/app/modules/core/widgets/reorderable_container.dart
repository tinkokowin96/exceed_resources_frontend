import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:flutter/material.dart';

class ReorderableContainer extends StatelessWidget {
  final Function() up;
  final Function() down;
  final bool first;
  final bool last;
  final double? width;
  final Widget child;
  const ReorderableContainer({
    Key? key,
    required this.up,
    required this.down,
    required this.child,
    this.first = false,
    this.last = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AppRow(
        spacing: AppSize.md,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppColumn(
            spacing: AppSize.xs,
            children: [
              AppAnimatedPress(
                onPressed: () => first ? null : up(),
                child: Icon(
                  Icons.arrow_drop_up,
                  color: first ? AppTheme.of(context).color.disabled : AppTheme.of(context).color.primary,
                ),
              ),
              AppAnimatedPress(
                onPressed: () => last ? null : down(),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: last ? AppTheme.of(context).color.disabled : AppTheme.of(context).color.primary,
                ),
              ),
            ],
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
