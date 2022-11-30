import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/department_model.dart';
import 'package:flutter/material.dart';

class StructureItemCard extends StatelessWidget {
  final EStructure type;
  final Function() onPressed;
  final MColleague? colleague;
  final MDepartment? department;
  const StructureItemCard({
    Key? key,
    required this.onPressed,
    this.type = EStructure.ceo,
    this.colleague,
    this.department,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = department != null
        ? department!.name
        : colleague != null
            ? colleague!.position!.name
            : organization.ceoPositionName;
    final short = department != null
        ? department!.shortName
        : colleague != null
            ? colleague!.position!.shortName
            : organization.ceoPositionShort;
    final image = colleague != null
        ? colleague!.image
        : type == EStructure.ceo
            ? organization.ceoImage
            : null;
    final name = colleague != null
        ? colleague!.name
        : type == EStructure.ceo
            ? organization.ceoName
            : null;
    final email = colleague != null
        ? colleague!.email
        : type == EStructure.ceo
            ? organization.ceoEmail
            : null;
    final phone = colleague != null
        ? colleague!.phone
        : type == EStructure.ceo
            ? organization.ceoPhone
            : null;
    final executive = department != null
        ? department!.executives.length == 1
            ? 'Executive: ${department!.executives[0].name}'
            : '${department!.executives.length} Executives'
        : null;
    return InkWell(
      onTap: onPressed,
      child: AppContainer(
        width: App.width(context) * 0.7,
        padding: 0,
        noShadow: false,
        shadow: AppThemeMiscs.shadow3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.sm),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: title,
                  style: AppTheme.text(
                    context: context,
                    weight: FontWeight.w500,
                    size: EText.h2,
                  ),
                  children: [
                    if (short.isNotEmpty)
                      TextSpan(
                        text: ' ($short)',
                        style: AppTheme.text(
                          context: context,
                          weight: FontWeight.w500,
                          size: EText.h2,
                        ),
                      )
                  ],
                ),
              ),
            ),
            Divider(thickness: 1.5, color: AppTheme.of(context).color.idle),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSize.sm,
                0,
                AppSize.sm,
                AppSize.sm,
              ),
              child: AppRow(
                spacing: AppSize.md,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: department == null
                    ? MainAxisAlignment.start
                    : department!.colleagues.isNotEmpty
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                children: department == null
                    ? [
                        AppCircle.image(size: AppSize.cLg, image: image!),
                        Column(
                          //   spacing: AppSize.xs,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name!,
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                type: ETextType.subtitle,
                              ),
                            ),
                            Text(
                              email!,
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                type: ETextType.subtitle,
                              ),
                            ),
                            Text(
                              phone!,
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                type: ETextType.subtitle,
                              ),
                            ),
                          ],
                        )
                      ]
                    : [
                        Expanded(
                          child: Text(
                            executive!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: department!.colleagues.isEmpty ? TextAlign.center : TextAlign.start,
                            style: AppTheme.text(
                              context: context,
                              weight: FontWeight.w500,
                              type: ETextType.subtitle,
                            ),
                          ),
                        ),
                        if (department!.colleagues.isNotEmpty)
                          Expanded(
                            child: Text(
                              '${department!.colleagues.length} Employees',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                type: ETextType.subtitle,
                              ),
                            ),
                          ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
