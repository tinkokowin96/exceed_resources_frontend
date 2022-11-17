import 'package:chewie/chewie.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/test_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/data.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends GetView<TestController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController(url: asset_data[4]));
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
