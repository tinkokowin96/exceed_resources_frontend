import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class TaskCollaborators extends StatelessWidget {
  final List<MCollaboratorM> collaborators;
  final MCollaboratorM assignedBy;
  const TaskCollaborators({
    Key? key,
    required this.collaborators,
    required this.assignedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppColumn(
          spacing: AppSize.sm,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Collaborators',
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                type: ETextType.subtitle,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: App.containerWidth(context) / 2),
              child: Wrap(
                spacing: AppSize.sm,
                runSpacing: AppSize.xs,
                children: List.from(
                  collaborators.map(
                    (each) => AppCircle.container(
                      width: AppSize.cSm,
                      color: AppTheme.of(context).color.secondary.withOpacity(0.1),
                      child: Text(
                        each.colleague.name.firstCharCaptilize(),
                        style: AppTheme.text(
                          context: context,
                          type: ETextType.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        AppColumn(
          spacing: AppSize.sm,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Assigned By',
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                type: ETextType.subtitle,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: App.containerWidth(context) / 2),
              child: AppCircle.container(
                width: AppSize.cSm,
                color: AppTheme.of(context).color.secondary.withOpacity(0.1),
                child: Text(
                  assignedBy.colleague.name.firstCharCaptilize(),
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.primary,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
