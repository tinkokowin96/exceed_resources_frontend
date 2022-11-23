import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat/unread_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:flutter/material.dart';

class ColleagueItem extends StatelessWidget {
  final String image;
  final int numUnread;
  final String name;
  final String description;

  final String? salary;
  const ColleagueItem({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    this.numUnread = 0,
    this.salary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: App.width(context) / 3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AppCircle.image(size: AppSize.cSm, image: image),
                  if (numUnread > 0) UnreadMessage(numUnread: numUnread),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.text(context: context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.md),
                child: Text(
                  description,
                  textAlign: salary == null ? TextAlign.end : TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(context: context),
                ),
              ),
            ),
            if (salary != null)
              Text(
                salary!,
                textAlign: TextAlign.end,
                style: AppTheme.text(context: context),
              ),
          ],
        )),
      ],
    );
  }
}
