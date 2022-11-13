import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class SeperatedSection extends StatelessWidget {
  final List<MOption> data;
  const SeperatedSection({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: AppTheme.of(context).color.idle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.from(
              data.map(
                (each) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        each.text,
                        style: AppTheme.text(
                          context: context,
                          type: ETextType.subtitle,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        each.value.toString(),
                        style: AppTheme.text(context: context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(color: AppTheme.of(context).color.idle),
      ],
    );
  }
}
