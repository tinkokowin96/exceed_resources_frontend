import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StructureArrow extends StatelessWidget {
  final bool add;
  final Function()? onAdd;
  const StructureArrow({
    Key? key,
    this.add = false,
    this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (add) {
      return AppAnimatedPress(
        onPressed: () => onAdd != null ? onAdd!() : null,
        child: SvgPicture.asset('assets/icons/add.svg', width: AppSize.icoMd),
      );
    }
    return ColoredBox(
      color: AppTheme.of(context).color.idle,
      child: const SizedBox(
        width: 2,
        height: 20,
      ),
    );
  }
}
