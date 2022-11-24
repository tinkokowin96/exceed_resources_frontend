import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CreateGroupController extends AppController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final searchFocus = FocusNode();
  final colleagues = Rx<List<MColleague>>(m_colleagues);
  late final participants = Rx<List<MColleague>>([]);

  void updateParticipant({required String id, bool add = true}) {
    if (add) {
      participants.value.add(colleagues.value.firstWhere((each) => each.id == id));
      colleagues.value.removeWhere((each) => each.id == id);
    } else {
      colleagues.value.add(participants.value.firstWhere((each) => each.id == id));
      participants.value.removeWhere((each) => each.id == id);
    }
    participants.refresh();
    colleagues.refresh();
  }

  void submitHandler() {}

  @override
  void onClose() {
    searchFocus.dispose();
    nameController.dispose();
    super.onClose();
  }
}
