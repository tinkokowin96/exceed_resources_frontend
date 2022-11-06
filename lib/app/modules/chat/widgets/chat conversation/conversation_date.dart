import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class ConversationDate extends StatelessWidget {
  final String date;
  const ConversationDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ColoredBox(
                color: AppTheme.of(context).color.idle.withOpacity(0.5),
                child: const SizedBox(
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
              child: Text(
                date,
                style: AppTheme.text(
                  context: context,
                  type: ETextType.subtitle,
                  size: EText.h4,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ColoredBox(
                color: AppTheme.of(context).color.idle.withOpacity(0.5),
                child: const SizedBox(
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
