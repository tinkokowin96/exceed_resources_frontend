import 'package:exceed_resources_frontend/app/modules/chat/controllers/create_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      content: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.md),
                  child: Text(
                    'Create Group',
                    style: AppTheme.text(
                      context: context,
                      size: EText.h2,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'Create Group *'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
