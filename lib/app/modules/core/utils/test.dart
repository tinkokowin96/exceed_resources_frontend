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
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            ColleagueListing(
              selectedColleagues: {
                m_colleagues[0].departmentName!: [
                  m_colleagues[0],
                  m_colleagues[1],
                  m_colleagues[2],
                  m_colleagues[3],
                ],
                m_colleagues[5].departmentName!: [
                  m_colleagues[5],
                  m_colleagues[6],
                  m_colleagues[7],
                ]
              },
              remainingColleagues: {
                m_colleagues[0].departmentName!: [
                  m_colleagues[4],
                ],
                m_colleagues[5].departmentName!: [
                  m_colleagues[8],
                  m_colleagues[9],
                ],
                m_colleagues[10].departmentName!: [
                  m_colleagues[10],
                  m_colleagues[11],
                  m_colleagues[12],
                  m_colleagues[13],
                  m_colleagues[14],
                ],
                m_colleagues[15].departmentName!: [
                  m_colleagues[15],
                  m_colleagues[16],
                  m_colleagues[17],
                  m_colleagues[18],
                  m_colleagues[19],
                ],
                m_colleagues[20].departmentName!: [
                  m_colleagues[20],
                  m_colleagues[21],
                  m_colleagues[22],
                  m_colleagues[23],
                  m_colleagues[24],
                ],
              },
              exportable: true,
              showSalary: true,
            )
          ],
        ),
      ),
    );
  }
}
