import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:flutter/material.dart';

class QuotationMinimize extends StatelessWidget {
  const QuotationMinimize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppColumn(
            spacing: AppSize.xs,
            children: [
              Text(
                'Num Quotation',
                style: AppTheme.text(context: context),
              ),
              Text(
                '57 Quotation',
                style: AppTheme.text(
                  context: context,
                  type: ETextType.subtitle,
                ),
              ),
            ],
          ),
          AppColumn(
            spacing: AppSize.xs,
            children: [
              Text(
                'Total Budget',
                style: AppTheme.text(context: context),
              ),
              Text(
                '10345 Lakh MMK',
                style: AppTheme.text(
                  context: context,
                  type: ETextType.subtitle,
                ),
              ),
            ],
          ),
          AppColumn(
            spacing: AppSize.xs,
            children: [
              Text(
                'Total Profits',
                style: AppTheme.text(
                  context: context,
                ),
              ),
              Text(
                '8570 Lakh MMk',
                style: AppTheme.text(
                  context: context,
                  type: ETextType.subtitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
