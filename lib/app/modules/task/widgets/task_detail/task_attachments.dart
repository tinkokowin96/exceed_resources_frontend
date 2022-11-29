import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            if (each.type == EAttachment.image) {
              return InkWell(
                onTap: () => Get.toNamed(AppRoutes.attachmentFullscreen, arguments: each),
                child: CachedNetworkImage(
                  imageUrl: each.url,
                  width: width,
                  height: 300,
                ),
              );
            }
            if (each.type == EAttachment.pdf) {
              return SizedBox(
                width: width,
                height: 300,
                child: InkWell(
                  onTap: () => Get.toNamed(AppRoutes.attachmentFullscreen, arguments: each),
                  child: CachedNetworkImage(
                    imageUrl: each.thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            return Center(
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.webview, arguments: each),
                child: Text(
                  each.url,
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
