import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/item_button.dart';
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
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AppSizeBox.lg, AppSizeBox.lg, ProjectPhase(maxWidth: constraint.maxWidth)],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
