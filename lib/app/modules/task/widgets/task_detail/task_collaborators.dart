import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/task_collaborator.dart';
import 'package:flutter/material.dart';

class TaskCollaborators extends StatelessWidget {
  final List<MCollaboratorM> collaborators;
  final MCollaboratorM assignedBy;
  final double width;
  const TaskCollaborators({
    Key? key,
    required this.collaborators,
    required this.assignedBy,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width / 2),
                child: Wrap(
                  spacing: AppSize.sm,
                  runSpacing: AppSize.xs,
                  children: List.from(
                    collaborators.map(
                      (each) => TaskCollaborator(
                        collaborator: each,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width / 2),
                child: TaskCollaborator(
                  collaborator: assignedBy,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
