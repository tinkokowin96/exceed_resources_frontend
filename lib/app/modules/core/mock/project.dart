import 'package:exceed_resources_frontend/app/modules/core/mock/phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/project_model.dart';

final m_projects = [
  MProjectM(id: 'pro_1', name: 'Myanmar Forward'),
  MProjectM(id: 'pro_2', name: 'Super Boss'),
  MProjectM(id: 'pro_3', name: 'EPOS'),
];

final projects = [
  MProject(
    id: 'pro_1',
    name: 'Myanmar Forward',
    phase: m_phases[0],
    numNewTask: 10,
    numProgressTask: 5,
    numOverdueTask: 4,
    numCompletedTask: 20,
  ),
  MProject(
    id: 'pro_2',
    name: 'Super Boss',
    phase: m_phases[1],
    numNewTask: 5,
    numProgressTask: 3,
    numOverdueTask: 2,
    numCompletedTask: 50,
  ),
  MProject(
    id: 'pro_3',
    name: 'EPOS',
    phase: m_phases[2],
    numNewTask: 2,
    numProgressTask: 10,
    numOverdueTask: 0,
    numCompletedTask: 40,
  ),
];
