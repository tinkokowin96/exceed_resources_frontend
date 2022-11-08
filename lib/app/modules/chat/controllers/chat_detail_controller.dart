import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/chat_detail.dart';
import 'package:get/state_manager.dart';

class ChatDetailController extends AppController {
  final chatDetail = Rx<MChatDetail>(chatDetails[0]);
}
