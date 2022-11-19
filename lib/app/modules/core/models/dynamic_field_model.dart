import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class MDynamicField {
  final EDynamicField type;
  final Widget child;
  final int oriKey;
  int key;
  TextEditingController? controller;

  MDynamicField({
    required this.type,
    required this.oriKey,
    required this.key,
    required this.child,
    this.controller,
  });
}
