import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final bool leftRadius;
  final bool rightRadius;
  final bool noShadow;

  final Gradient? gradient;
  final double? borderRadius;
  final Color? background;
  final BoxShadow? shadow;
  final double? padding;
  final double? width;
  final double? height;
  final Widget? child;
  const AppContainer({
    Key? key,
    this.leftRadius = false,
    this.rightRadius = false,
    this.noShadow = true,
    this.gradient,
    this.borderRadius,
    this.background,
    this.shadow,
    this.padding,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? background ?? AppTheme.of(context).color.container : null,
        borderRadius: leftRadius
            ? BorderRadius.only(
                topLeft: Radius.circular(borderRadius ?? AppSize.sm),
                bottomLeft: Radius.circular(borderRadius ?? AppSize.sm),
              )
            : rightRadius
                ? BorderRadius.only(
                    topRight: Radius.circular(borderRadius ?? AppSize.sm),
                    bottomRight: Radius.circular(borderRadius ?? AppSize.sm),
                  )
                : BorderRadius.all(
                    Radius.circular(borderRadius ?? AppSize.sm),
                  ),
        boxShadow: noShadow ? null : [shadow ?? AppThemeMiscs.shadow1],
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.all(padding ?? AppSize.sm),
          child: child,
        ),
      ),
    );
  }
}
