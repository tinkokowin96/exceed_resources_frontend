import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/message_input.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/task_comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_detail_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAllComments extends GetView<TaskDetailController> {
  final List<Comment> comments;
  const TaskAllComments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: App.height(context) * 0.6,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.from(
                comments.map(
                  (each) => TaskComment(comment: each),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () {
            return MessageInput(
              width: App.width(context) - AppSize.md,
              focus: controller.messageFocus,
              onFocusChange: controller.onMessageFocusChange,
              controller: controller.messageController,
              sendMessage: controller.onSendMessage,
              listenMessage: controller.listenMessage,
              updateAttachment: controller.updateMessageAttachment,
              attachments: controller.messageAttachments.value,
              employeeOptions: controller.employeeOptions,
              dropdown: controller.employeeDropdown.value,
              onDropdownChange: controller.onEmployeeDropdownChange,
              messageText: controller.messageText.value,
            );
          },
        ),
      ],
    );
  }
}