import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class AttachmentFullscreenController extends AppController {
  final MAttachment attachment = Get.arguments;
  final pdfAttachment = Rxn<Uint8List>();

  @override
  void onInit() {
    if (attachment.type == EAttachment.pdf) {
      doAysncTask(() {
        byteResponse(attachment.url).then((value) {
          pdfAttachment.value = value;
          pdfAttachment.refresh();
        });
      });
    }
    super.onInit();
  }
}
