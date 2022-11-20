import 'package:exceed_resources_frontend/app/modules/core/mock/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/collaborator.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/priority.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/project.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_text_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/task_model.dart';

final taskComments = [
  MComment(
    commentedBy: m_colleagues[0],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    commentTexts: [
      MCommentText(text: "Lorem Ipsum has been the industry's standard dummy tex"),
    ],
  ),
  MComment(
    commentedBy: m_colleagues[2],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    commentTexts: [
      MCommentText(text: "Contrary to popular belief "),
      MCommentText(text: "Htoo Aung", colleagueId: 'emp_2'),
    ],
  ),
  MComment(
    commentedBy: m_colleagues[1],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    commentTexts: [
      MCommentText(
          text:
              "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites"),
    ],
  ),
  MComment(
    commentedBy: m_colleagues[2],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 21)),
    commentTexts: [
      MCommentText(text: "The standard chunk of Lorem Ipsum used since the 1500s "),
      MCommentText(text: "Nander Aye ", colleagueId: 'emp_4'),
      MCommentText(text: "Lorem Ipsum used since the 1500s "),
    ],
  ),
  MComment(
    commentedBy: m_colleagues[3],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    commentTexts: [
      MCommentText(text: "Lorem Ipsum has been the industry's standard dummy tex"),
    ],
  ),
  MComment(
    commentedBy: m_colleagues[0],
    numLike: 3,
    updatedAt: DateTime.now().subtract(const Duration(hours: 15)),
    commentAttachments: m_attachments,
  ),
];
final tasks = [
  MTask(
    id: 'tas_1',
    name: 'Exceed Resources Task - 1',
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
    status: statuses[0],
    priority: priorities[1],
    project: m_projects[0],
    collaborators: [
      m_collaborators[0],
      m_collaborators[1],
      m_collaborators[2],
    ],
    assignedBy: m_collaborators[5],
    assignedDate: DateTime.now().add(const Duration(days: 55)),
    dueDate: DateTime.now().add(const Duration(days: 60)),
    attachments: asset_data,
    comments: [
      taskComments[0],
      taskComments[1],
    ],
  ),
  MTask(
    id: 'tas_2',
    name: 'Exceed Resources Task - 2',
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    status: statuses[1],
    priority: priorities[2],
    project: m_projects[0],
    collaborators: [
      m_collaborators[0],
      m_collaborators[1],
      m_collaborators[2],
    ],
    assignedBy: m_collaborators[5],
    assignedDate: DateTime.now().add(const Duration(days: 45)),
    dueDate: DateTime.now().add(const Duration(days: 47)),
    attachments: asset_data,
    comments: [
      taskComments[1],
    ],
  ),
  MTask(
    id: 'tas_3',
    name: 'Exceed Resources Task - 3',
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
    status: statuses[2],
    priority: priorities[2],
    project: m_projects[1],
    collaborators: [
      m_collaborators[2],
      m_collaborators[3],
      m_collaborators[5],
      m_collaborators[1],
    ],
    assignedBy: m_collaborators[5],
    assignedDate: DateTime.now().add(const Duration(days: 23)),
    dueDate: DateTime.now().add(const Duration(days: 30)),
    attachments: asset_data,
    comments: [
      taskComments[2],
      taskComments[3],
      taskComments[4],
      taskComments[5],
    ],
  ),
  MTask(
    id: 'tas_4',
    name: 'Exceed Resources Task - 4',
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
    status: statuses[3],
    priority: priorities[0],
    project: m_projects[2],
    collaborators: [
      m_collaborators[0],
      m_collaborators[1],
      m_collaborators[2],
    ],
    assignedBy: m_collaborators[5],
    assignedDate: DateTime.now().add(const Duration(days: 31)),
    dueDate: DateTime.now().add(const Duration(days: 34)),
    attachments: asset_data,
    comments: [
      taskComments[3],
    ],
  ),
  MTask(
    id: 'tas_5',
    name: 'Exceed Resources Task - 5',
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
    status: statuses[3],
    priority: priorities[2],
    project: m_projects[2],
    collaborators: [
      m_collaborators[3],
      m_collaborators[4],
    ],
    assignedBy: m_collaborators[5],
    assignedDate: DateTime.now().add(const Duration(days: 41)),
    dueDate: DateTime.now().add(const Duration(days: 50)),
    attachments: asset_data,
    comments: [
      taskComments[1],
      taskComments[2],
      taskComments[3],
      taskComments[4],
    ],
  ),
];
