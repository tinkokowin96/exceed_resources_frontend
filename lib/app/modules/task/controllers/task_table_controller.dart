import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_priority_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTableController extends GetxController {
  final statusController = TextEditingController();
  final detailPage = false.obs;

  final columns = ['Priority', 'Task Name', 'Due Date', 'Project'];
  final status = [
    Status(id: 'sta_1', name: 'progress', color: const Color(0xFFE78567)),
    Status(id: 'sta_2', name: 'deploy', color: const Color(0xFFE8CE8E)),
    Status(id: 'sta_3', name: 'complete', color: const Color(0xFF85B270)),
  ];
  final priority = [
    Priority(id: 'pri_1', name: 'High', color: const Color.fromARGB(255, 240, 137, 99)),
    Priority(id: 'pri_2', name: 'Medium', color: const Color.fromARGB(255, 226, 190, 99)),
    Priority(id: 'pri_3', name: 'Low', color: const Color.fromARGB(255, 125, 129, 106)),
  ];
  final projects = [
    Project(
      id: 'pro_1',
      name: 'Myanmar Eastern Project',
      phase: Phase(id: 'pha_1', name: 'Phase - 1'),
      numNewTask: 12,
      numProgressTask: 48,
      numCompletedTask: 60,
      numOverdueTask: 5,
    ),
    Project(
      id: 'pro_2',
      name: 'Super Boy Project',
      phase: Phase(id: 'pha_2', name: 'Phase - 2'),
      numNewTask: 6,
      numProgressTask: 32,
      numCompletedTask: 48,
      numOverdueTask: 3,
    ),
  ];
  late final tasks = [
    Task(
      id: 'tas_1',
      title: 'Change hero image',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[0],
      priority: priority[0],
      project: projects[0],
      assignedDate: DateTime.utc(2022, 10, 22),
      dueDate: DateTime.utc(2022, 10, 25),
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
        Comment(id: 'cmt_3', userId: 'usr_3', text: 'Shall we call ?', numLike: 2),
      ],
    ),
    Task(
      id: 'tas_2',
      title: 'Clear padding in the home page and follow the instructions',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[0],
      priority: priority[1],
      project: projects[1],
      assignedDate: DateTime.utc(2022, 10, 22),
      dueDate: DateTime.utc(2022, 10, 25),
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
      ],
    ),
    Task(
      id: 'tas_3',
      title: 'There are many variations of passages of Lorem Ipsum available',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[1],
      priority: priority[2],
      project: projects[0],
      assignedDate: DateTime.utc(2022, 10, 22),
      dueDate: DateTime.utc(2022, 10, 25),
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
        Comment(id: 'cmt_3', userId: 'usr_3', text: 'Shall we call ?', numLike: 2),
      ],
    ),
    Task(
      id: 'tas_4',
      title: 'Refactor and optimize map page to boost user experience',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[2],
      priority: priority[0],
      project: projects[1],
      assignedDate: DateTime.utc(2022, 10, 22),
      dueDate: DateTime.utc(2022, 10, 25),
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
        Comment(id: 'cmt_3', userId: 'usr_3', text: 'Shall we call ?', numLike: 2),
      ],
    ),
  ];

  List<List<Widget>> getRows({
    required BuildContext context,
    Project? activeProject,
  }) {
    final List<List<Widget>> rowList = [];

    for (var each in tasks) {
      if (activeProject == null || activeProject.id == each.project.id) {
        rowList.add(
          [
            StatusPriorityDropdown(
              priority: priority,
              initialPriority: each.priority,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    each.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.text(context: context, size: EText.h4),
                  ),
                ),
                StatusPriorityDropdown(
                  status: status,
                  initialStatus: each.status,
                )
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
          ],
        );
      }
    }
    return rowList;
  }
}
