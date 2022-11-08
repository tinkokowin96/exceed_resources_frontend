import 'package:exceed_resources_frontend/app/modules/chat/models/chat_group_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/chat_group.dart' as cg;
import 'package:get/state_manager.dart';

class ChatController extends AppController {
  final chatGroups = Rx<List<MChatGroup>>(cg.chatGroups);
}
