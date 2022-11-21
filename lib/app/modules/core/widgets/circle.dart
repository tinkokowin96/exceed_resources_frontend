import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppCircle {
  static Widget container({
    required double width,
    Widget? child,
    Color? color,
    Function()? onPressed,
  }) =>
      InkWell(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(width / 2),
          ),
          child: SizedBox(
            width: width,
            height: width,
            child: Center(child: child),
          ),
        ),
      );

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
                fit: BoxFit.cover,
              )
            : Image.asset(
                image,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
      );

  static Widget imageAction({
    required double size,
    required String image,
    required String asset,
    required Function() action,
    double actionSize = AppSize.cXxs,
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
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
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
