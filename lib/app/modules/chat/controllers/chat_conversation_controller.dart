import 'package:exceed_resources_frontend/app/modules/chat/models/chat_call_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatConversationController extends AppController {
  final scrollController = ScrollController();
  final messages = [
    MChatMessage(
      id: 'msg_1',
      chatText: [
        "Lorem Ipsum has been the industry's standard dummy",
        "There are many variations",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(hours: 2)),
      colleague: MColleagueM(
        id: 'emp_2',
        name: 'Sithu Lin Htut',
        image:
            'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        positionName: 'Frontend Developer',
      ),
    ),
    MChatMessage(
      id: 'msg_2',
      chatText: ["Contrary to popular belief, Lorem Ipsum"],
      createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 60)),
      colleague: MColleagueM(
        id: 'emp_4',
        name: 'Moe Kyaw',
        image:
            'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        positionName: 'Backend Developer',
      ),
    ),
    MChatMessage(
      id: 'msg_3',
      chatText: [
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 90)),
      colleague: MColleagueM(
        id: 'emp_2',
        name: 'Sithu Lin Htut',
        image:
            'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        positionName: 'UI Designer',
      ),
    ),
    MChatMessage(
      id: 'msg_4',
      chatText: ["Lorem Ipsum has been the industry's standard dummy"],
      createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
      colleague: MColleagueM(
        id: 'emp_1',
        name: 'Htoo Aung',
        image:
            'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        positionName: 'Frontend Developer',
      ),
    ),
    MChatMessage(
      id: 'msg_5',
      createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(minutes: 85)),
      chatCall: MChatCall(
        colleagues: [
          MColleagueM(
            id: 'emp_1',
            name: 'Htoo Aung',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'Frontend Developer',
          ),
          MColleagueM(
            id: 'emp_2',
            name: 'Moe Myint Kyaw',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'Frontend Developer',
          ),
          MColleagueM(
            id: 'emp_3',
            name: 'Nandar Aye',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'Frontend Developer',
          ),
        ],
        duration: 3000,
      ),
    ),
    MChatMessage(
      id: 'msg_6',
      chat_attachments: [
        MAttachment(
          type: EAttachmentType.image,
          name: 'Product 1',
          url:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
        ),
        MAttachment(
          type: EAttachmentType.image,
          name: 'Product 2',
          url:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
        ),
        MAttachment(
          type: EAttachmentType.image,
          name: 'Product 3',
          url:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
        ),
        MAttachment(
          type: EAttachmentType.image,
          name: 'You Reached Sam',
          url:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/you_reached_sam.pdf?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
      colleague: MColleagueM(
        id: 'emp_5',
        name: 'Nandar Aye',
        image:
            'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
        positionName: 'Frontend Developer',
      ),
    ),
  ];
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
          MColleagueM(
            id: 'emp_1',
            name: 'Htoo Aung',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'Frontend Developer',
          ),
          MColleagueM(
            id: 'emp_2',
            name: 'Sithu Lin Htut',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'Backend Developer',
          ),
          MColleagueM(
            id: 'emp_3',
            name: 'Nandar Aye',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: 'UI Designer',
          ),
          MColleagueM(
            id: 'emp_4',
            name: 'Htet Aung',
            image:
                'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
            positionName: '.Net Developer',
          ),
        ],
        pinMessages: [messages[0], messages[1], messages[4]],
        attachments: messages[4].chat_attachments,
        description:
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to",
      ),
    );
    updateLoading(value: false);
  }

  void loadNewData() {
    print('loading new data');
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
    super.onClose();
  }
}
