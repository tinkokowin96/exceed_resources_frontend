import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenView extends StatelessWidget {
  const FullscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppLayout.fullscreen(
        containerAction: Get.arguments['containerAction'],
        title: Get.arguments['title'],
        headerTail: Get.arguments['headerTail'],
        backAction: Get.arguments['backAction'],
        controller: Get.arguments['controller'],
        content: Get.arguments['content'],
      );
}
