import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/image_upload.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/reorderable_container.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/create_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateArticleView extends GetView<CreateArticleController> {
  const CreateArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout.core(
      currentMenu: EMenu.misc,
      controller: controller,
      title: 'Create Article',
      content: LayoutBuilder(builder: (context, constraint) {
        controller.formWidth = constraint.maxWidth;
        return SingleChildScrollView(
          child: AppColumn(
            spacing: AppSize.sm,
            children: [
              TextFormField(
                controller: controller.titleController,
                decoration: AppThemeMiscs.inputStyle(
                  context: context,
                  hintText: 'Title *',
                ),
              ),
              ImageUpload(
                placeHolder: 'assets/images/img_ph_ind_full.svg',
                width: constraint.maxWidth,
                height: AppSize.imgfeH,
                pickFile: (image) => null,
                updateError: controller.updateError,
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.sm),
                child: Obx(
                  () => AppColumn(
                    spacing: AppSize.sm,
                    children: List.from(
                      controller.fields.value.values.map(
                        (each) => ReorderableContainer(
                          up: () => controller.reorderField(each.key, true),
                          down: () => controller.reorderField(each.key, false),
                          first: each.key == 1,
                          last: controller.fields.value.values.length == each.key,
                          child: each.child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.md),
                child: AppColumn(
                  spacing: AppSize.sm,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add New Field",
                      style: AppTheme.text(
                        context: context,
                        weight: FontWeight.w500,
                        type: ETextType.subtitle,
                      ),
                    ),
                    AppRow(
                      spacing: AppSize.sm,
                      children: [
                        Flexible(
                          child: AppDropdown(
                            onChanged: ({checked, value}) => controller.addField(value!.value),
                            hint: 'Select Field To Add',
                            items: const [
                              MOption(text: 'Image', value: EDynamicField.image),
                              MOption(text: 'Carousel', value: EDynamicField.carousel),
                              MOption(text: 'Title', value: EDynamicField.title),
                              MOption(text: 'Body', value: EDynamicField.body),
                              MOption(text: 'Unordered', value: EDynamicField.unordered),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
