import 'dart:convert';
import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/status_priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TaskTableController extends GetxController {
  final statusController = TextEditingController();
  final detailPage = false.obs;
  final columns = ['Priority', 'Task Name', 'Due Date', 'Project'];
  final projects = [];
  final tasks = [];

  Map<String, List<Widget>> getRows({
    required BuildContext context,
    Project? activeProject,
  }) {
    final Map<String, List<Widget>> rowList = {};

    for (var each in tasks) {
      if (activeProject == null || activeProject.id == each.project.id) {
        rowList[each.id] = [
          StatusPriority(option: each.priority),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  each.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(context: context, size: EText.h4),
                ),
              ),
              StatusPriority(option: each.status),
            ],
          ),
          Text(
            formatDate(date: each.dueDate),
            style: AppTheme.text(context: context, size: EText.h4),
          ),
          Text(
            each.project.name,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.text(context: context, size: EText.h4),
          ),
        ];
      }
    }
    return rowList;
  }

  Future<void> readJsonFile() async {
    final dataString = await rootBundle.loadString('assets/mock/project.json');
    final data = jsonDecode(dataString);
    for (final item in data) {
      //   final project = Project(
      //     id: item.id,
      //     name: item.name,
      //     phase: item.phase,
      //     numNewTask: item.numNewTask,
      //     numProgressTask: item.numProgressTask,
      //     numOverdueTask: item.numOverdueTask,
      //     numCompletedTask: item.numCompletedTask,
      //   );
      final project = Project.fromJson(item);
    }
  }

  @override
  void onInit() {
    readJsonFile();
    super.onInit();
  }
}
