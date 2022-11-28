import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/payrise_model.dart';
import 'package:flutter/cupertino.dart';

class PayriseCard extends StatelessWidget {
  final MPayrise data;
  final double width;
  const PayriseCard({
    Key? key,
    required this.data,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppContainer(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: AppTheme.text(
                  context: context,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.md),
                child: AppColumn(
                  spacing: AppSize.sm,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppRow(
                      spacing: AppSize.sm,
                      children: [
                        Text(
                          'Absolute',
                          style: AppTheme.text(
                            context: context,
                            weight: FontWeight.w500,
                            type: ETextType.subtitle,
                          ),
                        ),
                        Text(
                          data.riseAbsolute ? 'True' : 'False',
                          style: AppTheme.text(
                            context: context,
                            type: ETextType.primary,
                          ),
                        ),
                      ],
                    ),
                    AppRow(
                      spacing: AppSize.sm,
                      children: [
                        Text(
                          'Amount',
                          style: AppTheme.text(
                            context: context,
                            weight: FontWeight.w500,
                            type: ETextType.subtitle,
                          ),
                        ),
                        Text(
                          data.amount.toString(),
                          style: AppTheme.text(context: context),
                        ),
                      ],
                    ),
                    AppRow(
                      spacing: AppSize.sm,
                      children: [
                        Text(
                          'Threshold',
                          style: AppTheme.text(
                            context: context,
                            weight: FontWeight.w500,
                            type: ETextType.subtitle,
                          ),
                        ),
                        Text(
                          data.thresholdAmount.toString(),
                          style: AppTheme.text(context: context),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: AppContainer(
            background: AppTheme.of(context).color.secondary,
            customRadius: const BorderRadius.only(
              bottomRight: Radius.circular(AppSize.sm),
            ),
            padding: AppSize.xs,
            child: Center(
              child: Text(
                data.riseOverTenure ? 'Tenure' : 'Point',
                style: AppTheme.text(
                  context: context,
                  size: EText.h4,
                  type: ETextType.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: AppSize.xs,
          right: 0,
          child: SizedBox(
            width: AppSize.swiW,
            height: AppSize.lg,
            child: CupertinoSwitch(
              activeColor: AppTheme.of(context).color.secondary,
              value: data.active,
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
