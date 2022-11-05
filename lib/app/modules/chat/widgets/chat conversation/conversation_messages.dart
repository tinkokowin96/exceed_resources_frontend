import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class ConversationMessages extends StatelessWidget {
  final MapEntry<String, List<MChatMessage>> messages;
  const ConversationMessages({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: ColoredBox(
                  color: AppTheme.of(context).color.idle.withOpacity(0.5),
                  child: const SizedBox(
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
                child: Text(
                  messages.key,
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: ColoredBox(
                  color: AppTheme.of(context).color.idle.withOpacity(0.5),
                  child: const SizedBox(
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
