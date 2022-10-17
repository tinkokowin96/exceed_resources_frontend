import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function() onPressed;
  const AddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAnimatedPress(
      onPressed: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppTheme.of(context).color.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSize.abtn / 2),
        ),
        child: SizedBox(
          width: AppSize.abtn,
          height: AppSize.abtn,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(
                Icons.add,
                size: AppSize.abtnIco,
                color: AppTheme.of(context).color.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
