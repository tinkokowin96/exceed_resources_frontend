import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/fullscreen_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AttachmentFullscreen extends GetView<FullscreenController> {
  final Attachment attachment;
  final AppPopup? popup;
  const AttachmentFullscreen({Key? key, required this.attachment, this.popup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.sm, vertical: AppSize.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppAnimatedPress(
                onPressed: () => Get.back(),
                child: const Icon(Icons.navigate_before),
              ),
              AppAnimatedPress(
                onPressed: () => download(
                  controller: controller,
                  name: attachment.name,
                  url: attachment.url,
                  data: attachment.data,
                ),
                child: const Icon(Icons.download),
              ),
            ],
          ),
        ),
        Expanded(
          child: attachment.type == EAttachmentType.image
              ? CachedNetworkImage(imageUrl: attachment.url!)
              : SfPdfViewer.memory(attachment.data!),
        ),
      ],
    );
  }
}
