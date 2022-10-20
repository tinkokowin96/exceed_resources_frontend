import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m.dart';
import 'package:flutter/material.dart';

class TaskCollaborator extends StatelessWidget {
  final CollaboratorM collaborator;
  const TaskCollaborator({
    Key? key,
    required this.collaborator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppTheme.of(context).color.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSize.emp / 2),
      ),
      child: SizedBox(
        width: AppSize.emp,
        height: AppSize.emp,
        child: Center(
          child: Text(
            transfromName(collaborator.employee.name),
            style: AppTheme.text(
              context: context,
              type: ETextType.primary,
            ),
          ),
        ),
      ),
    );
  }
}
