import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/project_phase.dart';
import 'package:exceed_resources_frontend/app/modules/task/components/project_quotation.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectController());
    return Scaffold(
      body: SizedBox(
        width: App.width(context),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [ProjectPhase()],
          ),
        ),
      ),
    );
  }
}
