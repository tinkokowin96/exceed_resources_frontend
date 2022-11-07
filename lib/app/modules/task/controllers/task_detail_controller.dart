import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailController extends AppController with AttachmentMixin {
  final tableController = Get.find<TaskTableController>();
  late final task = tableController.selectedTask.value;
  final statuses = Rx<List<MStatus>>([]);
  final priorities = Rx<List<MPriority>>([]);
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  final messageHasFoucus = false.obs;
  final messageAttachments = Rx<List<MAttachmentField>>([]);
  final colleagueDropdown = false.obs;
  final attachments = Rx<List<MAttachment>>([]);
  final messageText = Rx<List<MCommentText>>([]);
  final colleagueOptions = const [
    MOption(text: 'one', value: 1),
    MOption(text: 'two', value: 2),
    MOption(text: 'three', value: 3),
  ];
  String previousMessage = '';
  String messageBeforeLastChunk = '';

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
          if (messageText.value.last.colleagueId == null) {
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
            if (messageText.value.last.colleagueId == null) {
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

  Future<void> updateMessageAttachment({String? name}) async {
    final updatedAttachments = await updateAttachment(
      attachments: messageAttachments.value,
      name: name,
    );
    if (updatedAttachments != null) {
      messageAttachments.value = updatedAttachments;
      messageAttachments.refresh();
    }
  }

  void onMessageFocusChange(bool hasFocus) {
    messageHasFoucus.value = hasFocus;
    update();
  }

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

  void updateStatus() {}
  void updatePriority() {}
  void updateComment() {}

  Future<void> transformAttachments() async {
    for (final attachment in asset_data) {
      final fileName = RegExp(r'([^\/]*\.[a-z]{3,4})\?.*$').firstMatch(attachment)!.group(1);
      final fileType = RegExp(r'([a-z]{3,4})$').firstMatch(fileName!)!.group(1);
      if (imgTypes.contains(fileType)) {
        attachments.value.add(
          MAttachment(
            type: EAttachmentType.image,
            name: fileName,
            url: attachment,
          ),
        );
      } else if (fileType == 'pdf') {
        attachments.value.add(
          MAttachment(
            type: EAttachmentType.pdf,
            name: fileName,
            data: await byteResponse(attachment),
          ),
        );
      } else {
        attachments.value.add(
          MAttachment(
            type: EAttachmentType.others,
            name: fileName,
            url: attachment,
          ),
        );
      }
    }

    update();
  }

  @override
  void onInit() {
    transformAttachments();
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
