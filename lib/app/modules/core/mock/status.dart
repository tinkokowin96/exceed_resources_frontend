import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:flutter/material.dart';

final statuses = [
  MStatus(
    id: 'sta_1',
    name: 'Progress',
    color: Colors.orangeAccent,
  ),
  MStatus(
    id: 'sta_2',
    name: 'Completed',
    color: Colors.greenAccent,
  ),
  MStatus(
    id: 'sta_3',
    name: 'Bug',
    color: Colors.redAccent,
  ),
  MStatus(
    id: 'sta_4',
    name: 'Over Due',
    color: Colors.purple.shade200,
  ),
];
