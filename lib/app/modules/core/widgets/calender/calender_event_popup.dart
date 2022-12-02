import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_section.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/url.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/event_model.dart';
import 'package:flutter/material.dart';

class CalenderEventPopup extends StatelessWidget {
  final MEvent event;
  const CalenderEventPopup({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      spacing: AppSize.sm,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppContainer(
            background: AppTheme.of(context).color.category,
            borderRadius: 0,
            padding: AppSize.xs,
            child: Text(
              event.type!.name,
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                size: EText.h4,
                type: ETextType.white,
              ),
            ),
          ),
        ),
        Text(
          event.name,
          style: AppTheme.text(
            context: context,
            weight: FontWeight.w500,
            size: EText.h2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.md),
          child: DetailSection(
            title: 'Home',
            titlePercent: 0.2,
            detailWidget: Text(
              event.showInHome.toString().firstCapitalize(),
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                type: ETextType.primary,
              ),
            ),
          ),
        ),
        if (event.url.isNotEmpty)
          DetailSection(
            title: 'URL',
            titlePercent: 0.2,
            detailWidget: AppUrl(url: event.url, title: event.name),
          ),
        if (event.effectiveDate != null)
          DetailSection(
            title: 'Start',
            titlePercent: 0.2,
            detailText: event.effectiveDate!.formatDate(short: false),
          ),
        if (event.endDate != null)
          DetailSection(
            title: 'End',
            titlePercent: 0.2,
            detailText: event.endDate!.formatDate(short: false),
          ),
        if (event.repeatType != null)
          DetailSection(
            title: 'Repeat',
            titlePercent: 0.2,
            detailText: event.repeatType!.name.firstCapitalize(),
          ),
        if (event.repeatEvery != null)
          DetailSection(
            title: 'Every',
            titlePercent: 0.2,
            detailText: () {
              switch (event.repeatEvery.runtimeType) {
                case EWeekDay:
                  return (event.repeatEvery as EWeekDay).name.firstCapitalize();
                case EMonthDay:
                  return (event.repeatEvery as EMonthDay).name.firstCapitalize();
                default:
                  return event.repeatEvery.toString();
              }
            }(),
          ),
        if (event.description.isNotEmpty)
          Text(
            event.description,
            style: AppTheme.text(context: context),
          ),
        if (event.createdBy != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSize.md),
            child: Align(
              alignment: Alignment.centerRight,
              child: AppColumn(
                spacing: 0,
                children: [
                  Text(
                    event.createdBy!.name,
                    style: AppTheme.text(
                      context: context,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    event.createdBy!.position!.name,
                    style: AppTheme.text(
                      context: context,
                      weight: FontWeight.w500,
                      type: ETextType.subtitle,
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
