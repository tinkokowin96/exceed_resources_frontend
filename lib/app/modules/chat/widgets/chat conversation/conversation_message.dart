import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';

class ConversationMessage extends StatelessWidget {
  final MChatMessage message;
  const ConversationMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = Text(
      message.createdAt!.formatTime(),
      style: AppTheme.text(
        context: context,
        size: EText.h4,
        type: ETextType.subtitle,
      ),
    );

    final text = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: AppSize.sm),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: message.chatTexts != null
                ? [
                    message.colleague != null && message.colleague!.id != 'emp_1'
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: AppSize.sm),
                            child: Text(
                              message.colleague!.name,
                              style: AppTheme.text(context: context),
                            ),
                          )
                        : AppSizeBox.zero,
                    ...List.from(
                      message.chatTexts!.asMap().entries.map(
                            (each) => Padding(
                              padding: EdgeInsets.only(top: each.key == 0 ? 0 : AppSize.xs),
                              child: AppContainer(
                                background: AppTheme.of(context).color.container,
                                child: Text(
                                  each.value,
                                  style: AppTheme.text(context: context),
                                ),
                              ),
                            ),
                          ),
                    )
                  ]
                : [AppSizeBox.zero]),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: AppSize.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: message.chatCall == null && message.colleague != null && message.colleague!.id != 'emp_1'
            ? [
                AppCircle.image(size: AppSize.cMd, image: message.colleague!.image),
                text,
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: time,
                )
              ]
            : [
                Padding(
                  padding: const EdgeInsets.only(right: AppSize.sm),
                  child: time,
                ),
                text
              ],
      ),
    );
  }
}
