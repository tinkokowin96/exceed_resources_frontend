import 'package:exceed_resources_frontend/app/modules/misc/controllers/report_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ReportHistory extends GetView<ReportHistoryController> {
  final String id;
  const ReportHistory({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportHistoryController());
    return Text('Report');
  }
}
