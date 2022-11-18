import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class MDynamicField {
  final EDynamicField type;
  final Widget widget;
  TextEditingController? controllers;

  MDynamicField({
    required this.type,
    required this.widget,
    this.controllers,
  });
}
