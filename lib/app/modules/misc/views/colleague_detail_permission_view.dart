import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_detail_permission_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColleagueDetailPermissionView extends GetView<ColleagueDetailPermissionController> {
  const ColleagueDetailPermissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      controller: controller,
      currentMenu: EMenu.misc,
      title: 'Detail Permissions',
      content: Container(),
    );
  }
}
