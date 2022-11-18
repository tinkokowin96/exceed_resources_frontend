import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/misc_action.dart';
import 'package:flutter/material.dart';

class MiscActionSection extends StatelessWidget {
  final String name;
  final List<List<MiscAction>> actions;
  const MiscActionSection({
    Key? key,
    required this.name,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      background: AppTheme.of(context).color.container,
      child: AppColumn(
        spacing: AppSize.md,
        endSpacing: AppSize.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTheme.text(
              context: context,
              weight: FontWeight.w500,
              type: ETextType.subtitle,
            ),
          ),
          AppColumn(
            spacing: AppSize.sm,
            children: List.from(
              actions.map(
                (row) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.from(
                    row.asMap().entries.map(
                          (each) => Flexible(
                            child: Align(
                              alignment: actions.length == 1 && each.key == row.length - 1
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: each.key == 0 ? 0 : AppSize.md),
                                child: each.value,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
