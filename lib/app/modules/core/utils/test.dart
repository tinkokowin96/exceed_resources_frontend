import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_listing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: Column(
        children: [
          ColleagueListing(
            selectedColleagues: [
              m_colleagues[0],
              m_colleagues[1],
              m_colleagues[2],
              m_colleagues[3],
              m_colleagues[5],
              m_colleagues[6],
              m_colleagues[7],
            ],
            remainingColleagues: [
              m_colleagues[4],
              ...m_colleagues.sublist(8),
            ],
            exportable: true,
            updatable: true,
            showSalary: true,
          )
        ],
      ),
    );
  }
}
