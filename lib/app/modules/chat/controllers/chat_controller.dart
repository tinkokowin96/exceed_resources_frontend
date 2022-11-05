import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_group_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final chatGroups = [
    MChatGroup(
      type: EChat.projects,
      chatConversations: [
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'Myanmar Forward Enterprise',
          numUnread: 13,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'EPOS',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'New Life Myanmar',
          numUnread: 5,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'True Shop',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
      ],
    ),
    MChatGroup(
      type: EChat.departments,
      chatConversations: [
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'Myanmar Forward Enterprise',
          numUnread: 13,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'EPOS',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'New Life Myanmar',
          numUnread: 5,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'True Shop',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
      ],
    ),
    MChatGroup(
      type: EChat.groups,
      chatConversations: [
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'Myanmar Forward Enterprise',
          numUnread: 13,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'EPOS',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'New Life Myanmar',
          numUnread: 5,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'True Shop',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
      ],
    ),
    MChatGroup(
      type: EChat.colleagues,
      chatConversations: [
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'Myanmar Forward Enterprise',
          numUnread: 13,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'EPOS',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'New Life Myanmar',
          numUnread: 5,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
        MChatConversationM(
          image:
              'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
          name: 'True Shop',
          numUnread: 0,
          lastMessage:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
        ),
      ],
    ),
  ];
}
