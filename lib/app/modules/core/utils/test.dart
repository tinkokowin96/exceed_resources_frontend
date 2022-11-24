import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/organization_structure/structure_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSize.md),
        child: Center(
          child: StructureItemCard(),
        ),
      ),
    );
  }
}
