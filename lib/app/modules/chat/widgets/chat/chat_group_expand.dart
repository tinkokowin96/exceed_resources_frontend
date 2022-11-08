import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/chat/unread_message.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:flutter/material.dart';

class ChatGroupExpand extends StatelessWidget {
  final List<MChatConversationM> conversations;
  final double width;
  const ChatGroupExpand({
    Key? key,
    required this.conversations,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.from(
            conversations.map(
              (each) => Padding(
                padding: const EdgeInsets.only(top: AppSize.md),
                child: Row(
                  children: [
                    SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: AppSize.cSm,
                            height: AppSize.cSm,
                            child: Stack(
                              children: [
                                AppCircle.image(size: AppSize.cSm, image: each.image),
                                each.numUnread > 0 ? UnreadMessage(numUnread: each.numUnread) : AppSizeBox.zero,
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.sm,
                              ),
                              child: Text(
                                each.name,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.text(context: context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        each.lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.text(context: context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
