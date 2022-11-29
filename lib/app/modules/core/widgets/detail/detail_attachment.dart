import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/video_player.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAttachment extends StatelessWidget {
  final List<MAttachment> attachments;
  final AppController controller;
  final String homeRoute;
  final String? title;
  const DetailAttachment({
    Key? key,
    required this.attachments,
    required this.controller,
    required this.homeRoute,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'Attachments',
              style: AppTheme.text(
                context: context,
                weight: FontWeight.w500,
                type: ETextType.subtitle,
              ),
            ),
            AppTextButton(
              onPressed: () => download(
                controller: controller,
                attachments: attachments,
                context: context,
              ),
              text: 'Download',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.sm),
          child: AppCarousel(
            data: List.from(
              attachments.map(
                (each) {
                  if (each.type == EAttachment.url) {
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
                  }
                  return InkWell(
                    onTap: () {
                      if (each.type == EAttachment.video) {
                        Get.toNamed(
                          AppRoutes.fullscreen,
                          arguments: AppVideoPlayer(
                            url: each.url,
                            homeRoute: homeRoute,
                            controller: controller,
                            playerController: controller.playerController,
                            chewieController: controller.chewieController,
                          ),
                        );
                      } else {
                        Get.toNamed(AppRoutes.attachmentFullscreen, arguments: each);
                      }
                    },
                    child: CachedNetworkImage(
                      imageUrl: each.type == EAttachment.image ? each.url : each.thumbnail,
                      width: App.containerWidth(context),
                      height: AppSize.secH,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            width: App.containerWidth(context),
            height: AppSize.secH,
          ),
        ),
      ],
    );
  }
}
