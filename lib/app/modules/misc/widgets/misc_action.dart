import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/misc_action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MiscAction extends StatelessWidget {
  final MMiscAction action;
  const MiscAction({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action.action,
      child: AppRow(
        spacing: AppSize.sm,
        children: [
          SvgPicture.asset(action.image, width: AppSize.icoMd, height: AppSize.icoMd),
          Text(action.name, style: AppTheme.text(context: context))
        ],
      ),
    );
  }
}
