import 'dart:math';

import 'package:exceed_resources_frontend/app/modules/core/models/switch_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AppSwitch extends StatelessWidget {
  final MSwitch data;
  final bool active;
  final Function() toggleSwitch;
  final Color? activeBackground;
  final Color? inactiveBackground;
  final Color? activeBorder;
  final Color? inactiveBorder;
  final Color? activeIconBackground;
  final Color? inactiveIconBackground;
  final Color? activeIconColor;
  final Color? inactiveIconColor;

  const AppSwitch({
    Key? key,
    required this.data,
    required this.active,
    required this.toggleSwitch,
    this.activeBackground,
    this.inactiveBackground,
    this.activeBorder,
    this.inactiveBorder,
    this.activeIconBackground,
    this.inactiveIconBackground,
    this.activeIconColor,
    this.inactiveIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTween = MovieTween()
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'left',
        Tween(begin: 5.0, end: 34.0),
      )
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'background',
        ColorTween(
          begin: inactiveBackground ?? Colors.white,
          end: activeBackground ?? Colors.white,
        ),
      )
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'border',
        ColorTween(
          begin: inactiveBorder ?? AppTheme.of(context).color.secondary,
          end: activeBorder ?? AppTheme.of(context).color.secondary,
        ),
      )
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'iconBackground',
        ColorTween(
          begin: inactiveIconBackground ?? AppTheme.of(context).color.secondary,
          end: activeIconBackground ?? AppTheme.of(context).color.secondary,
        ),
      )
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'iconColor',
        ColorTween(
          begin: inactiveIconColor ?? Colors.white,
          end: activeIconColor ?? Colors.white,
        ),
      )
      ..scene(duration: const Duration(milliseconds: 300)).tween(
        'icon',
        ConstantTween(data.activeIcon),
      )
      ..scene(duration: const Duration(milliseconds: 600)).tween(
        'rotate',
        Tween(begin: -2 * pi, end: 0.0),
      );
    return CustomAnimationBuilder<Movie>(
      control: active ? Control.play : Control.playReverse,
      tween: customTween,
      duration: customTween.duration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: toggleSwitch,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: value.get('background'),
              border: Border.all(color: value.get('border')),
              borderRadius: BorderRadius.circular(AppSize.lg / 2),
            ),
            child: SizedBox(
              width: 70,
              height: AppSize.lg,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: value.get('left')),
                    child: Transform.rotate(
                      angle: value.get('rotate'),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: value.get('iconBackground'),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Center(
                            child: Icon(
                              value.get('icon'),
                              size: 16,
                              color: value.get('iconColor'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
