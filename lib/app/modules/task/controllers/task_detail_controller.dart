import 'dart:convert';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/employee_m.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_type.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskDetailController extends AppController with AttachmentMixin {
  final taskTableController = Get.find<TaskTableController>();
  final stopwatch = Stopwatch();
  late final task = Rxn<Task>(taskTableController.tasks.isNotEmpty ? taskTableController.tasks.first : null);
  final statuses = Rx<List<Status>>([]);
  final priorities = Rx<List<Priority>>([]);
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  final messageHasFoucus = false.obs;
  final messageAttachments = Rx<List<AttachmentField>>([]);
  final employeeDropdown = false.obs;
  final attachments = Rx<List<Attachment>>([]);
  final messageText = Rx<List<CommentType>>([]);
  final data = [
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/you_reached_sam.pdf?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc'
  ];
  final comments = [
    Comment(
        id: 'cmt_1',
        textComment: [
          CommentType(text: 'Can I get help from '),
          CommentType(text: 'Htoo Aung', employeeId: 'emp_11'),
          CommentType(text: ' bro?')
        ],
        commentedBy: EmployeeM(
          id: 'emp_1',
          name: 'Moe Kyaw',
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        ),
        numLike: 1,
        updatedAt: DateTime.now().subtract(const Duration(minutes: 30)))
  ];
  final employeeOptions = const [
    Option(text: 'one', value: 1),
    Option(text: 'two', value: 2),
    Option(text: 'three', value: 3),
  ];
  String previousMessage = '';
  String messageBeforeLastChunk = '';
  late final Comment attachmentComment;

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
            messageText.value.add(CommentType(text: lastChunkMessage));
          } else {
            if (messageText.value.last.employeeId == null) {
              messageText.value.last.text = lastChunkMessage;
            } else {
              messageText.value.add(CommentType(text: lastChunkMessage));
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

  void onEmployeeDropdownChange(Option? value) {
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
        CommentType(text: value.text, employeeId: value.value.toString()),
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
      statuses.value.add(Status.fromJson(item));
    }
    for (final item in priorityData) {
      priorities.value.add(Priority.fromJson(item));
    }
    await taskTableController.readJsonFile();
  }

  Future<void> transformAttachments() async {
    for (final attachment in data) {
      final fileName = RegExp(r'([^\/]*\.[a-z]{3,4})\?.*$').firstMatch(attachment)!.group(1);
      final fileType = RegExp(r'([a-z]{3,4})$').firstMatch(fileName!)!.group(1);
      if (imgTypes.contains(fileType)) {
        attachments.value.add(
          Attachment(
            type: EAttachmentType.image,
            name: fileName,
            url: attachment,
          ),
        );
      } else if (fileType == 'pdf') {
        attachments.value.add(
          Attachment(
            type: EAttachmentType.pdf,
            name: fileName,
            data: await byteResponse(attachment),
          ),
        );
      } else {
        attachments.value.add(
          Attachment(
            type: EAttachmentType.others,
            name: fileName,
            url: attachment,
          ),
        );
      }
    }
    final elapsed = stopwatch.elapsed.inMilliseconds;
    if (elapsed < minimunLoading) {
      await Future.delayed(Duration(milliseconds: minimunLoading - elapsed));
    }
    loading.value = false;
    attachmentComment = Comment(
      attachments: attachments.value,
      liked: true,
      commentedBy: EmployeeM(
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
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
