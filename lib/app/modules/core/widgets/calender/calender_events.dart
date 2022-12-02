import 'package:exceed_resources_frontend/app/modules/core/controllers/calender_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/calender/calender_event_popup.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/datetime_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CalenderEvents extends GetView<CalenderController> {
  const CalenderEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      topRadius: true,
      borderRadius: AppSize.md,
      width: App.width(context),
      padding: AppSize.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.selected.value.formatDate(short: false),
            style: AppTheme.text(
              context: context,
              weight: FontWeight.w500,
              size: EText.h2,
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.selectedDayEvents.value.isEmpty
                  ? Center(
                      child: Text(
                        'There is no event on this day',
                        style: AppTheme.text(
                          context: context,
                          weight: FontWeight.w500,
                          size: EText.h1,
                          type: ETextType.subtitle,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: AppSize.md),
                      child: Wrap(
                        spacing: AppSize.sm,
                        runSpacing: AppSize.sm,
                        children: List.from(
                          controller.selectedDayEvents.value.map(
                            (evt) => AppAnimatedPress(
                              onPressed: () => controller.showPopup(
                                popupWidget: AppPopup(
                                  controller: controller,
                                  child: CalenderEventPopup(event: evt),
                                ),
                              ),
                              child: AppContainer(
                                background: evt.color,
                                borderRadius: AppSize.lg,
                                noBorder: true,
                                child: Text(
                                  evt.name,
                                  style: AppTheme.text(
                                    context: context,
                                    weight: FontWeight.w500,
                                    type: ETextType.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
