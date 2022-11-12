import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat/unread_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:flutter/material.dart';

class MessageOverview extends StatelessWidget {
  final String image;
  final int numUnread;
  final String name;
  final String description;
  const MessageOverview({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    this.numUnread = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: Row(
        children: [
          SizedBox(
            width: AppSize.cMd,
            height: AppSize.cMd,
            child: Stack(
              children: [
                AppCircle.image(size: AppSize.cMd, image: image),
                if (numUnread > 0) UnreadMessage(numUnread: numUnread),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.text(context: context),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.text(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
