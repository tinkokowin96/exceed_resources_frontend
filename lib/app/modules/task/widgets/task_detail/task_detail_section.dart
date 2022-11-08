import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class TaskDetailSection extends StatelessWidget {
  final String title;
  final EdgeInsets? detailPadding;
  final String? detailText;
  final Widget? detailWidget;
  final Axis direction;
  const TaskDetailSection({
    Key? key,
    required this.title,
    this.direction = Axis.horizontal,
    this.detailPadding,
    this.detailText,
    this.detailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.text(
            context: context,
            type: ETextType.subtitle,
            weight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: detailPadding ?? const EdgeInsets.only(left: AppSize.md),
          child: detailText == null
              ? detailWidget
              : Text(
                  detailText!,
                  style: AppTheme.text(context: context, type: ETextType.primary),
                ),
        ),
      ],
    );
  }
}
