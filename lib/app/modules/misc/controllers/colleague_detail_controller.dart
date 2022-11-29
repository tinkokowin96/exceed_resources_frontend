import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/message_input_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';

class ColleagueDetailController extends AppController with MessageInputMixin {
  final data = m_colleagues[0];
}
