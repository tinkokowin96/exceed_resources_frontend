import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_switcher.dart';
import 'package:flutter/material.dart';

class Expandable extends StatelessWidget {
  final String name;
  final Function() toggleExpand;
  final Widget heading;
  final Widget content;
  final bool expand;
  const Expandable({
    Key? key,
    required this.name,
    required this.toggleExpand,
    required this.heading,
    required this.content,
    this.expand = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: expand ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.only(top: AppSize.sm),
        child: Column(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: AppTheme.text(
                      context: context,
                      weight: FontWeight.w500,
                      type: ETextType.subtitle,
                    ),
                  ),
                  AppAnimatedSwitcher(child: heading),
                ],
              ),
            ),
            Expanded(
              flex: expand ? 1 : 0,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return AppAnimatedSwitcher(
                    child: expand
                        ? SizedBox(
                            key: content.key,
                            height: expand ? constraint.maxHeight : null,
                            child: content,
                          )
                        : content,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: GestureDetector(
                onTap: toggleExpand,
                child: Icon(expand ? Icons.expand_more : Icons.expand_less),
              ),
            ),
            Divider(color: AppTheme.of(context).color.idle)
          ],
        ),
      ),
    );
  }
}
