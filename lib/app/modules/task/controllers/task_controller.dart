import 'package:exceed_resources_frontend/app/modules/task/models/comment.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final taskPage = false.obs;
  final status = [
    Status(id: 'sta_1', text: 'progress', color: const Color(0xFFE78567)),
    Status(id: 'sta_2', text: 'deploy', color: const Color(0xFFE8CE8E)),
    Status(id: 'sta_3', text: 'complete', color: const Color(0xFF85B270)),
  ];
  final priority = [
    Priority(id: 'pri_1', text: 'High', color: const Color.fromARGB(255, 240, 137, 99)),
    Priority(id: 'pri_2', text: 'Medium', color: const Color.fromARGB(255, 226, 190, 99)),
    Priority(id: 'pri_3', text: 'Low', color: const Color.fromARGB(255, 125, 129, 106)),
  ];
  late final tasks = [
    Task(
      id: 'tas_1',
      title: 'Change hero image',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[0],
      priority: priority[0],
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
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
        Comment(id: 'cmt_3', userId: 'usr_3', text: 'Shall we call ?', numLike: 2),
      ],
    ),
    Task(
      id: 'tas_4',
      title: 'Change hero image',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of',
      status: status[0],
      priority: priority[0],
      comments: [
        Comment(id: 'cmt_1', userId: 'usr_1', text: 'Can I get help from <men>usr_3:Htoo Aung</men>', numLike: 2),
        Comment(id: 'cmt_2', userId: 'usr_2', text: 'Yes sure.', numLike: 0),
        Comment(id: 'cmt_3', userId: 'usr_3', text: 'Shall we call ?', numLike: 2),
      ],
    ),
  ];
}
