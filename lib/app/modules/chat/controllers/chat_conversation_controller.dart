import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:get/state_manager.dart';

class ChatConversationController extends AppController {
  final messages = [
    MChatMessage(
      id: 'msg_1',
      chat_text: "Lorem Ipsum has been the industry's standard dummy",
      updatedAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(hours: 2)),
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
      chat_text: "Contrary to popular belief, Lorem Ipsum",
      updatedAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 60)),
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
      chat_text:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock",
      updatedAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 90)),
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
      chat_text: "Lorem Ipsum has been the industry's standard dummy",
      updatedAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
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
      updatedAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
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
// messages.value = messages.value.f;
    final Map<String, List<MChatMessage>> messagesObject = {};
    for (final message in messages) {
      final formattedDate = formatDate(date: message.updatedAt);
      if (messagesObject.containsKey(formattedDate)) {
        messagesObject[formattedDate]!.add(message);
      } else {
        messagesObject[formattedDate] = [message];
      }
    }
    for (final each in messagesObject.entries) {
      messagesObject[each.key]!.sort(
        (a, b) => a.updatedAt!.millisecondsSinceEpoch.compareTo(b.updatedAt!.millisecondsSinceEpoch),
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

  @override
  void onInit() {
    updateLoading(value: true);
    transformData();
    super.onInit();
  }
}
