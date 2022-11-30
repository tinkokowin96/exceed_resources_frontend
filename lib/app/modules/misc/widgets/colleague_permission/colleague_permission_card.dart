import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_permission_model.dart';
import 'package:flutter/material.dart';

class ColleaguePermissionCard extends StatelessWidget {
  final MColleaguePermission permission;
  final Function(MColleaguePermission) updateSelected;
  final bool selected;
  const ColleaguePermissionCard({
    Key? key,
    required this.permission,
    required this.updateSelected,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String assignedTo = '';
    if (permission.allowAll) {
      assignedTo += 'All colleagues';
    } else if (permission.departments.isNotEmpty) {
      if (permission.departments.length == 1 && permission.positions.isEmpty) {
        assignedTo += permission.departments.first.name;
      } else {
        assignedTo +=
            '${permission.departments.length} department${permission.departments.length > 1 ? 's' : ''}, ${permission.positions.length} position${permission.positions.length > 1 ? 's' : ''}';
      }
    } else {
      assignedTo += permission.positions.length == 1
          ? permission.positions.first.name
          : '${permission.positions.length} positions';
    }
    return AppAnimatedPress(
      onPressed: () => updateSelected(permission),
      child: AppContainer(
        width: App.cardSize(context: context, numCol: 2),
        noBorder: false,
        selected: selected,
        child: AppColumn(
          spacing: AppSize.sm,
          children: [
            Text(
              permission.name,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context, weight: FontWeight.w500),
            ),
            Text(
              assignedTo,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
