import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/carousel.dart';
import 'package:exceed_resources_frontend/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAttachments extends StatelessWidget {
  final List<String> attachments;
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
            const imgTypes = ['jpg', 'jpeg', 'png'];
            final fileName = RegExp(r'([^\/]*\.[a-z]{3,4})\?.*$').firstMatch(each)!.group(1);
            final fileType = RegExp(r'([a-z]{3,4})$').firstMatch(fileName!)!.group(1);
            if (imgTypes.contains(fileType)) {
              return CachedNetworkImage(
                imageUrl: each,
                width: width,
                height: 300,
              );
            }
            return Center(
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.webview, arguments: each),
                child: Text(
                  fileName,
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
