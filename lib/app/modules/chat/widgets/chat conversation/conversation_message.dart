import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';

class ConversationMessage extends StatelessWidget {
  final List<MChatMessage> messages;
  const ConversationMessage({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.from(
          messages.map(
            (each) => Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: App.width(context) * 0.9,
                    child: Row(
                      children: [
                        each.colleague == null
                            ? AppSizeBox.zero
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: each.colleague!.image,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppSize.sm),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSize.sm),
                          child: Text(
                            '${each.createdAt!.hour < 10 ? '0${each.createdAt!.hour}' : each.createdAt!.hour} : ${each.createdAt!.minute < 10 ? '0${each.createdAt!.minute}' : each.createdAt!.minute} ${each.createdAt!.hour > 12 ? ' pm' : ' am'}',
                            style: AppTheme.text(
                              context: context,
                              size: EText.h4,
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
          ),
        ),
      ),
    );
  }
}
