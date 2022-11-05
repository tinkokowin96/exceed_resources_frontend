import 'package:exceed_resources_frontend/app/modules/chat/controllers/create_group_controller.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/chat/widgets/participant.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.chat,
      containerAction: () => controller.searchFocus.unfocus(),
      title: 'Create Group',
      headerAction: controller.submitHandler,
      headerActionText: 'Create',
      content: Padding(
        padding: const EdgeInsets.only(top: AppSize.md),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: AppThemeMiscs.inputStyle(context: context, hintText: 'Create Group *'),
                  ),
                  Obx(
                    () => controller.participants.value.isEmpty
                        ? AppSizeBox.zero
                        : Padding(
                            padding: const EdgeInsets.only(top: AppSize.md),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: constraint.maxWidth),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Participants',
                                    style: AppTheme.text(context: context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: AppSize.sm),
                                    child: Wrap(
                                      spacing: AppSize.sm,
                                      runSpacing: AppSize.sm,
                                      children: List.from(
                                        controller.participants.value.map(
                                          (each) => Participant(
                                            colleague: each,
                                            onDelete: () => controller.updateParticipant(id: each.id, add: false),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppSize.md),
                    child: TextField(
                      focusNode: controller.searchFocus,
                      decoration: AppThemeMiscs.inputStyle(
                        context: context,
                        hintText: 'Search',
                        style: EInputStyle.line,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppSize.md),
                      child: Obx(
                        () {
                          return ListView(
                            children: List.from(
                              controller.colleagues.value.map(
                                (each) => Colleague(
                                  colleague: each,
                                  addColleague: controller.updateParticipant,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
