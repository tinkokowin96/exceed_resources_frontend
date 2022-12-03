import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ColleagueHistoryView extends GetView<ColleagueHistoryController> {
  const ColleagueHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: '${controller.colleague.name} History',
      noPadding: true,
      content: Column(
        children: [
          Obx(() {
            return SectionHeading(
              sections: const ['Leaves', 'Lates', 'Overtimes', 'Salary', 'Tasks', 'Reports'],
              prevIndex: controller.prevIndex.value,
              activeIndex: controller.activeIndex.value,
              updateIndex: controller.updateIndex,
            );
          }),
        ],
      ),
    );
  }
}
