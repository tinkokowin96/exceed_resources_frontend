import 'package:exceed_resources_frontend/app/modules/misc/controllers/leave_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LeaveHistory extends GetView<LeaveHistoryController> {
  final String id;
  const LeaveHistory({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LeaveHistoryController());
    return Text('Leave');
  }
}
