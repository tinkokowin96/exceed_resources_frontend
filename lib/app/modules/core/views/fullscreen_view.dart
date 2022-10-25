import 'package:exceed_resources_frontend/app/modules/core/controllers/fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenView extends GetView<FullscreenController> {
  const FullscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<FullscreenController>(
        builder: (_) => AppLayout.fullscreen(
          loading: _.loading.value,
          popup: _.popup.value,
          content: Get.arguments,
        ),
      );
}
