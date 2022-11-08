import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/message.dart';

final chatDetails = [
  MChatDetail(
    image:
        'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    name: 'New Life Myanmar',
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
];
