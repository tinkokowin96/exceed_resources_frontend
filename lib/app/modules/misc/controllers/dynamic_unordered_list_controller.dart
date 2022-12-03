import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/dynamic_list_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/dynamic_field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class DynamicUnorderedListController extends AppController with DynamicListMixin {
  void addField(EDynamicField type) {
    final addIndex = fields.value.isEmpty ? 1 : fields.value.keys.last + 1;
    final fieldController = TextEditingController();
    final fieldWidget = Stack(
      children: [
        TextFormField(
          controller: fieldController,
          maxLines: 3,
          decoration: AppThemeMiscs.inputStyle(
            context: Get.context!,
            hintText: 'Add text *',
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
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
    fields.value[addIndex] =
        MDynamicField(key: addIndex, oriKey: addIndex, type: type, child: fieldWidget, controller: fieldController);
    controllers[addIndex] = fieldController;
    fields.refresh();
  }

  @override
  void onInit() {
    addField(EDynamicField.body);
    super.onInit();
  }
}
