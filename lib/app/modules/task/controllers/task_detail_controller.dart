import 'dart:convert';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final employeeDropdown = false.obs;
  final attachments = Rx<List<MAttachment>>([]);
  final messageText = Rx<List<MCommentType>>([]);
  final data = [
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/you_reached_sam.pdf?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc'
  ];
  final comments = [
    MComment(
        id: 'cmt_1',
        textComment: [
          MCommentType(text: 'Can I get help from '),
          MCommentType(text: 'Htoo Aung', employeeId: 'emp_11'),
          MCommentType(text: ' bro?')
        ],
        commentedBy: MEmployeeM(
          id: 'emp_1',
          name: 'Moe Kyaw',
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        ),
        numLike: 1,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 30)))
  ];
  final employeeOptions = const [
    MOption(text: 'one', value: 1),
    MOption(text: 'two', value: 2),
    MOption(text: 'three', value: 3),
  ];
  String previousMessage = '';
  String messageBeforeLastChunk = '';
  late final MComment attachmentComment;

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
      if (!employeeDropdown.value) {
        employeeDropdown.value = true;
        employeeDropdown.refresh();
      }
    } else {
      if (employeeDropdown.value) {
        employeeDropdown.value = false;
        employeeDropdown.refresh();
      }
      if (value.length != previousMessage.length) {
        final isDelete = value.length < previousMessage.length;
        final lastChunkMessage = value.replaceFirst(messageBeforeLastChunk, '');
        if (isDelete) {
          if (messageText.value.last.employeeId == null) {
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
            messageText.value.add(MCommentType(text: lastChunkMessage));
          } else {
            if (messageText.value.last.employeeId == null) {
              messageText.value.last.text = lastChunkMessage;
            } else {
              messageText.value.add(MCommentType(text: lastChunkMessage));
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

  void onEmployeeDropdownChange(MOption? value) {
    if (value != null) {
      employeeDropdown.value = false;
      messageController.text = messageController.text.replaceFirst('@', value.text);
      employeeDropdown.refresh();
      messageController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: messageController.text.length,
        ),
      );

      messageText.value.add(
        MCommentType(text: value.text, employeeId: value.value.toString()),
      );
      messageBeforeLastChunk = messageController.text;
      previousMessage = messageController.text;
    }
  }

  void updateStatus() {}
  void updatePriority() {}
  void updateComment() {}

  Future<void> readJsonFile() async {
    final statusDataString = await rootBundle.loadString('assets/mock/status.json');
    final priorityDataString = await rootBundle.loadString('assets/mock/priority.json');
    final statusData = jsonDecode(statusDataString);
    final priorityData = jsonDecode(priorityDataString);
    for (final item in statusData) {
      statuses.value.add(MStatus.fromJson(item));
    }
    for (final item in priorityData) {
      priorities.value.add(MPriority.fromJson(item));
    }
  }

  Future<void> transformAttachments() async {
    for (final attachment in data) {
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

    attachmentComment = MComment(
      attachments: attachments.value,
      liked: true,
      commentedBy: MEmployeeM(
        id: 'emp_11',
        name: 'Kyaw Thura',
        image: data[1],
      ),
      numLike: 2,
      updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    );
    update();
  }

  @override
  void onInit() {
    stopwatch.start();
    readJsonFile();
    transformAttachments();
    updateLoading(value: false, elapsed: stopwatch.elapsedMilliseconds);
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
