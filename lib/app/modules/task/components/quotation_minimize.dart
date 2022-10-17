import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Num Quotation',
                style: AppTheme.text(
                  context: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.xs,
                ),
                child: Text(
                  '57 Quotation',
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Budget',
                style: AppTheme.text(
                  context: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.xs),
                child: Text(
                  '10345 Lakh MMK',
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Profits',
                style: AppTheme.text(
                  context: context,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.xs),
                child: Text(
                  '8570 Lakh MMk',
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
