import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/dynamic_list_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/dynamic_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/image_upload.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/dynamic_unordered_list_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/dynamic_unordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreateArticleController extends AppController with DynamicListMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final image = Rxn();
  late double formWidth;

  void addField(EDynamicField type) {
    final addIndex = fields.value.isEmpty ? 1 : fields.value.keys.last + 1;
    late final Widget fieldWidget;
    TextEditingController? fieldController;

    switch (type) {
      case EDynamicField.image:
        fieldWidget = Stack(
          children: [
            ImageUpload(
              placeHolder: 'assets/images/img_ph_ind_full.svg',
              width: formWidth,
              height: AppSize.imgfeH,
              pickFile: (image) => null,
              updateError: updateError,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => removeFieldHandler(addIndex),
                child: SvgPicture.asset(
                  'assets/icons/remove.svg',
                  width: AppSize.icoSm,
                ),
              ),
            ),
          ],
        );
        break;
      case EDynamicField.carousel:
        break;
      case EDynamicField.unordered:
        fieldWidget = DynamicUnorderedList(
          width: formWidth,
          id: addIndex,
          removeList: () {
            removeFieldHandler(addIndex);
            Get.delete<DynamicUnorderedListController>(tag: addIndex.toString());
          },
        );
        break;
      default:
        fieldController = TextEditingController();
        fieldWidget = Stack(
          children: [
            TextFormField(
              controller: fieldController,
              decoration: AppThemeMiscs.inputStyle(
                context: Get.context!,
                hintText: 'Add text *',
                suffix: type.name.capitalizeFirst,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => removeFieldHandler(addIndex),
                child: SvgPicture.asset(
                  'assets/icons/remove.svg',
                  width: AppSize.icoSm,
                ),
              ),
            )
          ],
        );
    }
    fields.value[addIndex] = MDynamicField(type: type, widget: fieldWidget, controllers: fieldController);
    controllers[addIndex] = fieldController;
    fields.refresh();
  }

  @override
  void onClose() {
    titleController.dispose();
    imageController.dispose();

    for (final controller in controllers.values) {
      if (controller != null) {
        controller.dispose();
      }
    }
    super.onClose();
  }
}
