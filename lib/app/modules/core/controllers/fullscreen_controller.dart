import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenController extends GetxController {
  final loading = false.obs;
  final popup = Rxn<Widget>();
}
