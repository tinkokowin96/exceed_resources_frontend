import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/helper.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StructureArrow extends StatelessWidget {
  final bool oneItem;
  final bool add;
  final Function()? onAdd;
  const StructureArrow({
    Key? key,
    this.oneItem = false,
    this.add = true,
    this.onAdd,
  }) : super(key: key);

  Widget horizontalLine(BuildContext context) {
    final width = App.width(context) - 2 * AppSize.md;

    return ColoredBox(
      color: AppTheme.of(context).color.idle,
      child: SizedBox(
        width: width / 2,
        height: 2,
      ),
    );
  }

  Widget verticalLine(BuildContext context) {
    return ColoredBox(
      color: AppTheme.of(context).color.idle,
      child: const SizedBox(
        width: 2,
        height: 20,
      ),
    );
  }

  Widget addIcon(BuildContext context) {
    return AppAnimatedPress(
      onPressed: () => onAdd != null ? onAdd!() : null,
      child: SvgPicture.asset('assets/icons/add.svg', width: AppSize.icoMd),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 20,
          child: Stack(
            children: oneItem
                ? [if (add) Center(child: addIcon(context))]
                : [
                    Align(alignment: Alignment.topLeft, child: horizontalLine(context)),
                    Align(alignment: Alignment.topRight, child: horizontalLine(context)),
                    if (add)
                      Transform.translate(
                        offset: const Offset(0, -AppSize.icoMd / 3),
                        child: Align(
                          alignment: Alignment.center,
                          child: ColoredBox(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(AppSize.xs),
                              child: addIcon(context),
                            ),
                          ),
                        ),
                      ),
                  ],
          ),
        ),
        Row(
          mainAxisAlignment: oneItem ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: oneItem
              ? [
                  if (!add) verticalLine(context),
                ]
              : List.generate(
                  add ? 2 : 3,
                  (index) => verticalLine(context),
                ),
        ),
      ],
    );
  }
}
