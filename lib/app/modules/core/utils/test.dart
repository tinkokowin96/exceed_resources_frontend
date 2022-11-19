import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/draggable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: Center(
          // child: Obx(
          //   () {
          //     return AppColumn(
          //       spacing: AppSize.md,
          //       children: List.from(
          //         controller.children.value.values.map(
          //           (each) => AppDraggable(
          //             onDropped: controller.dropDraggable,
          //             item: each,
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          ),
    );
  }
}
