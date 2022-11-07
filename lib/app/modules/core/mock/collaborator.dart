import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/role.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/collaborator_m_model.dart';

final m_collaborators = [
  MCollaboratorM(
    id: 'coll_1',
    colleague: m_colleagues[0],
    role: m_roles[0],
  ),
  MCollaboratorM(
    id: 'coll_2',
    colleague: m_colleagues[1],
    role: m_roles[4],
  ),
  MCollaboratorM(
    id: 'coll_3',
    colleague: m_colleagues[2],
    role: m_roles[2],
  ),
  MCollaboratorM(
    id: 'coll_4',
    colleague: m_colleagues[3],
    role: m_roles[3],
  ),
  MCollaboratorM(
    id: 'coll_5',
    colleague: m_colleagues[4],
    role: m_roles[5],
  ),
  MCollaboratorM(
    id: 'coll_6',
    colleague: m_colleagues[5],
    role: m_roles[6],
  ),
];
