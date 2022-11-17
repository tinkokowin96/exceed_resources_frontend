import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SectionHeading extends StatelessWidget {
  final List<String> sections;
  final int prevIndex;
  final int activeIndex;
  final Function(int index) updateIndex;
  const SectionHeading({
    Key? key,
    required this.sections,
    required this.prevIndex,
    required this.activeIndex,
    required this.updateIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sectionWidth = App.width(context) / sections.length;
    final customTween = MovieTween()
      ..scene(duration: const Duration(milliseconds: 400)).tween(
        'left',
        Tween(
          begin: (sectionWidth * prevIndex) + (sectionWidth / 2 - AppSize.sm / 2),
          end: (sectionWidth * activeIndex) + (sectionWidth / 2 - AppSize.sm / 2),
        ),
      )
      ..scene(duration: const Duration(milliseconds: 400)).tween(
        'prevColor',
        ColorTween(
          begin: AppTheme.of(context).color.primary,
          end: AppTheme.of(context).color.idle,
        ),
      )
      ..scene(duration: const Duration(milliseconds: 400)).tween(
        'activeColor',
        ColorTween(
          begin: AppTheme.of(context).color.idle,
          end: AppTheme.of(context).color.primary,
        ),
      );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: AppTheme.of(context).color.idle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.xs),
          child: CustomAnimationBuilder<Movie>(
            key: ValueKey(activeIndex),
            curve: Curves.easeInOut,
            duration: customTween.duration,
            tween: customTween,
            builder: (context, value, child) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.from(
                    sections.asMap().entries.map(
                          (each) => Flexible(
                            child: GestureDetector(
                              onTap: () => updateIndex(each.key),
                              child: Center(
                                child: Text(
                                  each.value,
                                  style: AppTheme.text(context: context, weight: FontWeight.w500).copyWith(
                                    color: each.key == prevIndex && each.key != activeIndex
                                        ? value.get('prevColor')
                                        : each.key == activeIndex
                                            ? value.get('activeColor')
                                            : AppTheme.of(context).color.idle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSize.xs, left: value.get('left')),
                  child: ColoredBox(
                    color: AppTheme.of(context).color.secondary,
                    child: const SizedBox(width: AppSize.sm, height: AppSize.xs / 2),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: AppTheme.of(context).color.idle),
      ],
    );
  }
}
