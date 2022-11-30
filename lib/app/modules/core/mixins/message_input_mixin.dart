import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/comment.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/task_detail/comment_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageInputMixin on AppController {
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  final messageHasFoucus = false.obs;
  final messageAttachments = Rx<List<MAttachmentField>>([]);
  final messageText = Rx<List<MCommentText>>([]);
  final colleagueDropdown = false.obs;
  final colleagueOptions = const [
    MOption(text: 'one', value: 1),
    MOption(text: 'two', value: 2),
    MOption(text: 'three', value: 3),
  ];
  String previousMessage = '';
  String messageBeforeLastChunk = '';

  void onColleagueDropdownChange(MOption? value) {
    if (value != null) {
      colleagueDropdown.value = false;
      messageController.text = messageController.text.replaceFirst('@', value.text);
      colleagueDropdown.refresh();
      messageController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: messageController.text.length,
        ),
      );
      messageText.value.add(
        MCommentText(text: value.text, colleagueId: value.value.toString()),
      );
      messageBeforeLastChunk = messageController.text;
      previousMessage = messageController.text;
    }
  }

  void onSendMessage() {
    messageController.clear();
  }

  void removeLastMessageChunk() {
    messageText.value.removeLast();
    messageBeforeLastChunk = '';
    for (int i = 0; i < messageText.value.length; i++) {
      messageBeforeLastChunk += messageText.value[i].text;
    }
    messageController.text = messageBeforeLastChunk;
    messageController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: messageController.text.length,
      ),
    );
    previousMessage = messageController.text;
  }

  void listenMessage(String value) {
    final regex = RegExp(r'@');
    if (regex.hasMatch(value)) {
      if (!colleagueDropdown.value) {
        colleagueDropdown.value = true;
        colleagueDropdown.refresh();
      }
    } else {
      if (colleagueDropdown.value) {
        colleagueDropdown.value = false;
        colleagueDropdown.refresh();
      }
      if (value.length != previousMessage.length) {
        final isDelete = value.length < previousMessage.length;
        final lastChunkMessage = value.replaceFirst(messageBeforeLastChunk, '');
        if (isDelete) {
          if (messageText.value.last.colleagueId.isEmpty) {
            if (lastChunkMessage.isEmpty) {
              removeLastMessageChunk();
            } else {
              messageText.value.last.text = lastChunkMessage;
            }
          } else {
            removeLastMessageChunk();
          }
        } else {
          if (messageText.value.isEmpty) {
            messageText.value.add(MCommentText(text: lastChunkMessage));
          } else {
            if (messageText.value.last.colleagueId.isEmpty) {
              messageText.value.last.text = lastChunkMessage;
            } else {
              messageText.value.add(MCommentText(text: lastChunkMessage));
            }
          }
        }
        previousMessage = value;
      }
    }
    messageText.refresh();
  }

  void onMessageFocusChange(bool hasFocus) {
    messageHasFoucus.value = hasFocus;
    update();
  }

  Future<void> updateMessageAttachment({String? name}) async {}

  Widget getAllCommentsWidget(List<MComment> comments, BuildContext context, showLike) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: App.height(context) * 0.6),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.from(
                  comments.map(
                    (each) => AppComment(comment: each, showLike: showLike),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSize.lg),
          child: Obx(
            () {
              return MessageInput(
                sendMessage: onSendMessage,
                attachments: messageAttachments.value,
                updateAttachment: updateMessageAttachment,
                input: CommentInput(
                  focus: messageFocus,
                  onFocusChange: onMessageFocusChange,
                  controller: messageController,
                  listenMessage: listenMessage,
                  colleagueOptions: colleagueOptions,
                  dropdown: colleagueDropdown.value,
                  onDropdownChange: onColleagueDropdownChange,
                  messageText: messageText.value,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
