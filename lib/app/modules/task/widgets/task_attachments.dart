import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/attachment_fullscreen.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TaskAttachments extends StatelessWidget {
  final List<MAttachment> attachments;
  final double width;
  const TaskAttachments({
    Key? key,
    required this.attachments,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCarousel(
      data: List.from(
        attachments.map(
          (each) {
            if (each.type == EAttachmentType.image) {
              return InkWell(
                onTap: () => Get.toNamed(
                  AppRoutes.fullscreen,
                  arguments: AttachmentFullscreen(
                    attachment: each,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: each.url!,
                  width: width,
                  height: 300,
                ),
              );
            }
            if (each.type == EAttachmentType.pdf) {
              return SizedBox(
                width: width,
                height: 300,
                child: Stack(
                  children: [
                    SfPdfViewer.memory(
                      each.data!,
                      enableDoubleTapZooming: false,
                    ),
                    InkWell(
                        onTap: () => Get.toNamed(
                              AppRoutes.fullscreen,
                              arguments: AttachmentFullscreen(
                                attachment: each,
                              ),
                            ),
                        child: SizedBox(
                          height: 300,
                          width: width,
                        ))
                  ],
                ),
              );
            }
            return Center(
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.webview, arguments: each),
                child: Text(
                  each.url!,
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.primary,
                  ).copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      width: width,
      height: 300,
    );
  }
}
