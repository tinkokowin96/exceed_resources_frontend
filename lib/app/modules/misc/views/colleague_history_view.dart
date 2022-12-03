import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_history_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/late_history.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/leave_history.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/overtime_history.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/report_history.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/salary_history.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_history/task_history.dart';
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
          Obx(
            () => AppColumn(
              spacing: AppSize.md,
              children: [
                SectionHeading(
                  sections: const ['Leaves', 'Lates', 'Overtimes', 'Salary', 'Tasks', 'Reports'],
                  prevIndex: controller.prevIndex.value,
                  activeIndex: controller.activeIndex.value,
                  updateIndex: controller.updateIndex,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.md),
                  child: controller.historyType.value == EHistory.leave
                      ? LeaveHistory(id: controller.colleague.id)
                      : controller.historyType.value == EHistory.late
                          ? LateHistory(id: controller.colleague.id)
                          : controller.historyType.value == EHistory.overtime
                              ? OvertimeHistory(id: controller.colleague.id)
                              : controller.historyType.value == EHistory.salary
                                  ? SalaryHistory(id: controller.colleague.id)
                                  : controller.historyType.value == EHistory.task
                                      ? TaskHistory(id: controller.colleague.id)
                                      : ReportHistory(id: controller.colleague.id),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
