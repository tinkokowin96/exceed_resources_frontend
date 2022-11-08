import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppCircle {
  static Widget image({
    required double size,
    required String image,
    bool network = true,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: network
            ? CachedNetworkImage(
                imageUrl: image,
                width: size,
                height: size,
              )
            : Image.asset(
                image,
                width: size,
                height: size,
              ),
      );

  static Widget imageAction({
    required double size,
    required String image,
    required String asset,
    required Function() action,
    double actionSize = AppSize.cXs,
    bool network = true,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            network
                ? CachedNetworkImage(
                    imageUrl: image,
                    width: size,
                    height: size,
                  )
                : Image.asset(
                    image,
                    width: size,
                    height: size,
                  ),
            Positioned(
              right: 0,
              top: 0,
              child: AppAnimatedPress(
                onPressed: action,
                child: SvgPicture.asset(
                  asset,
                  width: actionSize,
                  height: actionSize,
                ),
              ),
            ),
          ],
        ),
      );
}
