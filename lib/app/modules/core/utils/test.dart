import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/timer.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/project_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/project_phase.dart';
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
          child: Center(
            child: AppTimer(
              until: DateTime.now().subtract(
                const Duration(minutes: 1),
              ),
              style: AppTheme.text(context: context, type: ETextType.subtitle),
              onCompleted: () => print('completed'),
            ),
          ),
        ),
      ),
    );
  }
}
