import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColleagueDetailView extends GetView<ColleagueDetailController> {
  const ColleagueDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      content: Container(),
    );
  }
}
