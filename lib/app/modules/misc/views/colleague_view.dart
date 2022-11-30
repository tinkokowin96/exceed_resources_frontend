import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_listing.dart';
import 'package:exceed_resources_frontend/app/routes/misc_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ColleagueView extends GetView<ColleagueController> {
  const ColleagueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Colleagues',
      topPadding: AppSize.sm,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSize.sm),
            child: AppRow(
              spacing: AppSize.md,
              children: [
                AppAnimatedPress(
                  onPressed: () => Get.toNamed(MiscRoutes.payrise, arguments: controller.selected.value),
                  child: SvgPicture.asset('assets/icons/payrise.svg'),
                ),
                AppAnimatedPress(
                  onPressed: () => Get.toNamed(MiscRoutes.payrise, arguments: controller.selected.value),
                  child: SvgPicture.asset('assets/icons/permission.svg'),
                ),
                AppAnimatedPress(
                  onPressed: () => Get.toNamed(MiscRoutes.payrise, arguments: controller.selected.value),
                  child: SvgPicture.asset('assets/icons/add_outline.svg'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ColleagueListing(
              exportable: true,
              selectable: true,
              onSelectionChange: controller.updateSelected,
            ),
          ),
        ],
      ),
    );
  }
}
