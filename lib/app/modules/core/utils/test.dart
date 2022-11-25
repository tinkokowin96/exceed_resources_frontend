import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/report_size.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/organization_structure/structure_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportSize(
      onChange: (size) {},
      child: StructureItemCard(
        onPressed: () {},
        type: EStructure.department,
        colleague: m_colleagues[0],
      ),
    );
    Get.put(TestController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSize.md),
        child: Center(child: Container()),
      ),
    );
  }
}
