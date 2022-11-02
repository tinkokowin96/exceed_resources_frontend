import 'package:exceed_resources_frontend/app/modules/chat/views/create_group_view.dart';
import 'package:exceed_resources_frontend/app/routes/chat_routes.dart';
import 'package:get/get.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';

final List<GetPage<dynamic>> chatRoutes = [
  GetPage(
    name: ChatRoutes.chat,
    page: () => const ChatView(),
    binding: ChatBinding(),
    transitionDuration: Duration.zero,
  ),
  GetPage(
    name: ChatRoutes.createGroup,
    page: () => const CreateGroupView(),
    binding: ChatBinding(),
    transitionDuration: Duration.zero,
  ),
];
