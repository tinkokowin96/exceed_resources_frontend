import 'package:exceed_resources_frontend/app/modules/core/layout/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/misc_controller.dart';

class MiscView extends GetView<MiscController> {
  const MiscView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      content: Container(color: Colors.orangeAccent),
    );
  }
}
