import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/draggable.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/reorderable_container.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/dynamic_unordered_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DynamicUnorderedList extends GetView<DynamicUnorderedListController> {
  final int id;
  final Function() removeList;
  final double width;
  const DynamicUnorderedList({
    Key? key,
    required this.width,
    required this.id,
    required this.removeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DynamicUnorderedListController(), permanent: false, tag: id.toString());
    final controller = Get.find<DynamicUnorderedListController>(tag: id.toString());
    return Stack(
      children: [
        AppContainer(
          width: width,
          padding: AppSize.md,
          background: AppTheme.of(context).color.container,
          child: LayoutBuilder(builder: (context, constraint) {
            return Obx(
              () => AppColumn(
                spacing: AppSize.sm,
                children: [
                  ...List.from(
                    controller.fields.value.values.map(
                      (each) => ReorderableContainer(
                        up: () => controller.reorderField(each.key, true),
                        down: () => controller.reorderField(each.key, false),
                        first: each.key == 1,
                        last: controller.fields.value.values.length == each.key,
                        child: each.child,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.addField(EDynamicField.body),
                    child: AppContainer(
                      width: constraint.maxWidth,
                      padding: AppSize.fep,
                      background: AppTheme.of(context).color.secondary.withOpacity(0.05),
                      child: Text(
                        'Add New',
                        textAlign: TextAlign.center,
                        style: AppTheme.text(
                          context: context,
                          weight: FontWeight.w500,
                          type: ETextType.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: removeList,
            child: SvgPicture.asset(
              'assets/icons/remove.svg',
              width: AppSize.icoSm,
            ),
          ),
        ),
      ],
    );
  }
}
