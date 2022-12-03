import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/switch_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/switch.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/toggle.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/misc_action_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/misc_action.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/misc_action_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controllers/misc_controller.dart';

class MiscView extends GetView<MiscController> {
  const MiscView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      content: AppColumn(
        spacing: AppSize.md,
        firstNoSpacing: false,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MiscActionSection(
            name: 'Organization',
            actions: [
              [
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/onboarding.svg', name: 'On Boarding', action: () {}),
                ),
                MiscAction(
                  action:
                      MMiscAction(image: 'assets/icons/organization_structure.svg', name: 'Structure', action: () {}),
                ),
              ],
            ],
          ),
          MiscActionSection(
            name: 'Employee',
            actions: [
              [
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/employee.svg', name: 'Employees', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/event.svg', name: 'Event', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/leave.svg', name: 'Leave', action: () {}),
                ),
              ],
              [
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/overtime.svg', name: 'Overtime', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/payroll.svg', name: 'Payroll', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/calender.svg', name: 'Calender', action: () {}),
                ),
              ],
              [
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/expense.svg', name: 'Expense', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/account.svg', name: 'Account', action: () {}),
                ),
                MiscAction(
                  action: MMiscAction(image: 'assets/icons/currency.svg', name: 'Currency', action: () {}),
                ),
              ],
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.md),
              child: AppContainer(
                background: AppTheme.of(context).color.container,
                child: SingleChildScrollView(
                  child: AppColumn(
                    spacing: AppSize.lg,
                    endSpacing: AppSize.md,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppSize.md),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Change Language',
                              style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                            ),
                            Obx(
                              () => AppToggle(
                                disabled: const [],
                                isSelected: controller.selectedLanguage.value,
                                onSelectionChange: controller.changeLanguage,
                                children: languages,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dark Mode',
                            style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                          ),
                          Obx(
                            () => AppSwitch(
                              data: MSwitch(
                                activeIcon: controller.darkMode.value ? Icons.dark_mode : Icons.light_mode,
                                idleIcon: controller.darkMode.value ? Icons.light_mode : Icons.dark_mode,
                              ),
                              active: controller.darkMode.value,
                              toggleSwitch: controller.toggleDarkMode,
                              inactiveBackground: Colors.black,
                              inactiveBorder: Colors.black,
                              inactiveIconBackground: Colors.white,
                              inactiveIconColor: AppTheme.of(context).color.secondary,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Feedback & Help',
                            style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                          ),
                          Icon(Icons.navigate_next, color: AppTheme.of(context).color.idle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Share',
                            style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                          ),
                          Icon(Icons.navigate_next, color: AppTheme.of(context).color.idle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tutorials',
                            style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                          ),
                          Icon(Icons.navigate_next, color: AppTheme.of(context).color.idle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logout',
                            style: AppTheme.text(context: context, weight: FontWeight.w500, type: ETextType.subtitle),
                          ),
                          Icon(Icons.logout, color: AppTheme.of(context).color.idle),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppSize.md),
                        child: AppColumn(
                          spacing: AppSize.sm,
                          children: [
                            Text(
                              'Exceed Resources',
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w700,
                                size: EText.h1,
                                type: ETextType.subtitle,
                              ),
                            ),
                            Text(
                              'Copyright © 2022 Easfinity. All right reserved',
                              style: AppTheme.text(
                                context: context,
                                weight: FontWeight.w500,
                                size: EText.h2,
                                type: ETextType.subtitle,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
