import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/message.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatConversationController extends AppController with AttachmentMixin {
  final scrollController = ScrollController();
  final messageController = TextEditingController();
  final messageAttachments = Rx<List<MAttachmentField>>([]);
  final conversation = Rxn<MChatConversation>();

  void transformData() {
    final Map<String, List<MChatMessage>> messagesObject = {};
    for (final message in messages) {
      final formattedDate = message.createdAt!.formatDate();
      if (messagesObject.containsKey(formattedDate)) {
        messagesObject[formattedDate]!.add(message);
      } else {
        messagesObject[formattedDate] = [message];
      }
    }
    for (final each in messagesObject.entries) {
      messagesObject[each.key]!.sort(
        (a, b) => a.createdAt!.millisecondsSinceEpoch.compareTo(b.createdAt!.millisecondsSinceEpoch),
      );
    }
    conversation.value = MChatConversation(
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
      name: 'New Life Myanmar',
      numColleague: 4,
      chatMessages: messagesObject,
      chatDetail: MChatDetail(
        colleagues: [
          m_colleagues[0],
          m_colleagues[1],
          m_colleagues[3],
          m_colleagues[6],
        ],
        pinMessages: [
          messages[0],
          messages[1],
          messages[4],
        ],
        attachments: messages[4].chatAttachments,
        description:
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to",
      ),
    );
    updateLoading(value: false);
  }

  void loadNewData() {
    print('loading new data');
  }

  void onSendMessage() {
    messageController.clear();
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

  @override
  void onInit() {
    updateLoading(value: true);
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        loadNewData();
      }
    });
    transformData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
