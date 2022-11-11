import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/chat_detail.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ChatDetailController extends AppController {
  final chatDetail = Rx<MChatDetail>(chatDetails[0]);
  final findFocus = FocusNode();
  final colleagueExpandable = Rx<EExpandable>(EExpandable.expand);
  final pinExpandable = Rx<EExpandable>(EExpandable.minimize);

  void toggleExpandable({bool colleague = true}) {
    final expandable = colleague ? colleagueExpandable : pinExpandable;
    expandable.value = expandable.value == EExpandable.minimize ? EExpandable.expand : EExpandable.minimize;
    expandable.refresh();
  }

  @override
  void onClose() {
    findFocus.dispose();
    super.onClose();
  }
}
