import 'package:exceed_resources_frontend/app/modules/misc/controllers/late_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LateHistory extends GetView<LateHistoryController> {
  final String id;
  const LateHistory({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LateHistoryController());
    return Text('Late');
  }
}
