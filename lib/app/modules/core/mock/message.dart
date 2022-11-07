import 'package:exceed_resources_frontend/app/modules/chat/models/chat_call_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';

final messages = [
  MChatMessage(
    id: 'msg_1',
    chatTexts: [
      "Lorem Ipsum has been the industry's standard dummy",
      "There are many variations",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(hours: 2)),
    colleague: m_colleagues[0],
  ),
  MChatMessage(
    id: 'msg_2',
    chatTexts: ["Contrary to popular belief, Lorem Ipsum"],
    createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 60)),
    colleague: m_colleagues[0],
  ),
  MChatMessage(
    id: 'msg_3',
    chatTexts: [
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock",
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1)).subtract(const Duration(minutes: 90)),
    colleague: m_colleagues[1],
  ),
  MChatMessage(
    id: 'msg_4',
    chatTexts: ["Lorem Ipsum has been the industry's standard dummy"],
    createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
    colleague: m_colleagues[0],
  ),
  MChatMessage(
    id: 'msg_5',
    createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(minutes: 85)),
    chatCall: MChatCall(
      colleagues: [
        m_colleagues[0],
        m_colleagues[1],
        m_colleagues[2],
        m_colleagues[3],
        m_colleagues[4],
      ],
      duration: 3000,
    ),
  ),
  MChatMessage(
    id: 'msg_6',
    chatAttachments: attachments,
    createdAt: DateTime.now().subtract(const Duration(days: 2)).subtract(const Duration(hours: 2)),
    colleague: m_colleagues[3],
  ),
];
