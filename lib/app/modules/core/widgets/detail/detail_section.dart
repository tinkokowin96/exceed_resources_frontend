import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class DetailSection extends StatelessWidget {
  final String title;
  final double titlePercent;
  final EdgeInsets? detailPadding;
  final String? detailText;
  final ETextType? detailType;
  final Widget? detailWidget;
  final Axis direction;
  const DetailSection({
    Key? key,
    required this.title,
    this.titlePercent = 0.4,
    this.direction = Axis.horizontal,
    this.detailPadding,
    this.detailText,
    this.detailType,
    this.detailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Flex(
          direction: direction,
          mainAxisSize: direction == Axis.horizontal ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: constraint.maxWidth * titlePercent,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: AppTheme.text(
                  context: context,
                  type: ETextType.subtitle,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: detailPadding ??
                  EdgeInsets.only(
                    left: 0,
                    top: direction == Axis.vertical ? AppSize.sm : 0,
                  ),
              child: detailText == null
                  ? detailWidget
                  : Text(
                      detailText!,
                      style: AppTheme.text(context: context, type: detailType ?? ETextType.body),
                    ),
            ),
          ],
        );
      },
    );
  }
}
