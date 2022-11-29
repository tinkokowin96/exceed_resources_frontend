import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_permission_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColleaguePermissionView extends GetView<ColleaguePermissionController> {
  const ColleaguePermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      controller: controller,
      currentMenu: EMenu.misc,
      content: Container(),
    );
  }
}
