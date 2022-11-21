import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return const Scaffold(
      body: Center(
          // child: OnboardingItemCard(data: m_onbardings[1]),
          ),
    );
  }
}
