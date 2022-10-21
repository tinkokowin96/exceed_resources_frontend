import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class AttachmentFullscreen extends StatelessWidget {
  final String? url;
  final FutureOr<Uint8List>? data;
  const AttachmentFullscreen({
    Key? key,
    this.url,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSize.sm, right: AppSize.sm, top: AppSize.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppAnimatedPress(
                onPressed: () => Get.back(),
                child: const Icon(Icons.navigate_before),
              ),
              AppAnimatedPress(
                onPressed: () => download(),
                child: const Icon(Icons.download),
              ),
            ],
          ),
        ),
        Expanded(
          child: url != null
              ? CachedNetworkImage(imageUrl: url!)
              : PdfView(
                  controller: PdfController(
                    document: PdfDocument.openData(data!),
                  ),
                ),
        ),
      ],
    );
  }
}
