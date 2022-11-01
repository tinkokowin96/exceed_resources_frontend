import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class UnreadMessage extends StatelessWidget {
  final int numUnread;
  const UnreadMessage({
    Key? key,
    required this.numUnread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Transform.translate(
        offset: const Offset(AppSize.uubtn / 4, -AppSize.uubtn / 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppTheme.of(context).color.secondaryBackground,
            borderRadius: BorderRadius.circular(AppSize.uubtn / 2),
          ),
          child: SizedBox(
            width: AppSize.uubtn,
            height: AppSize.uubtn,
            child: Center(
              child: Text(
                numUnread.toString(),
                style: AppTheme.text(
                  context: context,
                  size: EText.h4,
                  type: ETextType.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
