import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class StatusPriority extends StatelessWidget {
  final dynamic option;
  const StatusPriority({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: option.color,
        borderRadius: BorderRadius.circular(AppSize.lg),
      ),
      child: SizedBox(
        width: AppSize.staW,
        height: AppSize.staH,
        child: Center(
          child: Text(
            option.name,
            style: AppTheme.text(
              context: context,
              size: EText.h5,
              type: ETextType.white,
            ),
          ),
        ),
      ),
    );
  }
}
