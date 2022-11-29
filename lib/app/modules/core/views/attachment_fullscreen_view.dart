import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/attachment_fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/layout/layout.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AttachmentFullscreenView extends GetView<AttachmentFullscreenController> {
  const AttachmentFullscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppLayout.fullscreen(
        title: '',
        headerTail: AppAnimatedPress(
          onPressed: () => download(
            context: context,
            controller: controller,
            attachments: [controller.attachment],
          ),
          child: const Icon(Icons.download),
        ),
        backAction: () => Get.delete<AttachmentFullscreenController>(),
        controller: controller,
        content: controller.attachment.type == EAttachment.image
            ? CachedNetworkImage(imageUrl: controller.attachment.url, width: App.width(context))
            : controller.attachment.type == EAttachment.pdf
                ? Obx(
                    () => controller.pdfAttachment.value != null
                        ? SfPdfViewer.memory(controller.pdfAttachment.value!)
                        : CachedNetworkImage(
                            imageUrl: controller.attachment.thumbnail,
                            width: App.width(context),
                          ),
                  )
                : AppSizeBox.zero,
      );
}
