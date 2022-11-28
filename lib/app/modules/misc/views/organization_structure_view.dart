import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/organization_structure_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/organization_structure/structure_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationStructureView extends GetView<OrganizationStructureController> {
  const OrganizationStructureView({Key? key}) : super(key: key);

  Widget downArrow(BuildContext context) {
    return ColoredBox(
      color: AppTheme.of(context).color.idle,
      child: const SizedBox(
        width: 2,
        height: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Organization Structure',
      noPadding: true,
      content: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.from(
              controller.data.value.entries.map(
                (each) {
                  final items = List<Widget>.from(
                    each.value.entries.map(
                      (item) {
                        final type = item.value.keys.first;
                        final data = item.value.values.first;
                        return StructureItemCard(
                          onPressed: () {},
                          type: type,
                          colleague: type == EStructure.topManagement ? data : null,
                          department: type == EStructure.department ? data : null,
                        );
                      },
                    ),
                  );

                  return AppCarousel(
                    width: App.width(context),
                    fraction: 0.7,
                    showIndicator: false,
                    data: items,
                    onChange: (index) => controller.updateStructure(each.key, index),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
