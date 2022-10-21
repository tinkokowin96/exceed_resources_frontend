import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskDetailController extends GetxController {
  final taskTableController = Get.find<TaskTableController>();
  final stopwatch = Stopwatch();
  final loading = true.obs;
  late final task = Rxn<Task>(taskTableController.tasks.isNotEmpty ? taskTableController.tasks.first : null);
  final statuses = Rx<List<Status>>([]);
  final priorities = Rx<List<Priority>>([]);
  final data = [
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_1.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_2.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/pro_3.jpg?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc',
    'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/you_reached_sam.pdf?alt=media&token=8ae71fee-b2af-4621-ac9f-9b34a7b3c8dc'
  ];
  final attachments = Rx<List<Map>>([]);

  void updateStatus() {}
  void updatePriority() {}
  void updateComment() {}

  Future<void> readJsonFile() async {
    final statusDataString = await rootBundle.loadString('assets/mock/status.json');
    final priorityDataString = await rootBundle.loadString('assets/mock/priority.json');
    final statusData = jsonDecode(statusDataString);
    final priorityData = jsonDecode(priorityDataString);
    for (final item in statusData) {
      statuses.value.add(Status.fromJson(item));
    }
    for (final item in priorityData) {
      priorities.value.add(Priority.fromJson(item));
    }
    await taskTableController.readJsonFile();
  }

  Future<void> transformAttachments() async {
    const imgTypes = ['jpg', 'jpeg', 'png'];
    for (final attachment in data) {
      final fileName = RegExp(r'([^\/]*\.[a-z]{3,4})\?.*$').firstMatch(attachment)!.group(1);
      final fileType = RegExp(r'([a-z]{3,4})$').firstMatch(fileName!)!.group(1);
      if (imgTypes.contains(fileType)) {
        attachments.value.add({'type': EAttachmentType.image, 'data': attachment});
      } else if (fileType == 'pdf') {
        attachments.value.add({'type': EAttachmentType.pdf, 'data': await byteResponse(attachment)});
      } else {
        attachments.value.add({'type': EAttachmentType.others, 'data': attachment});
      }
    }
    final elapsed = stopwatch.elapsed.inMilliseconds;
    if (elapsed < minimunLoading) {
      await Future.delayed(Duration(milliseconds: minimunLoading - elapsed));
    }
    loading.value = false;
    update();
  }

  @override
  void onInit() {
    stopwatch.start();
    readJsonFile();
    transformAttachments();
    super.onInit();
  }
}
