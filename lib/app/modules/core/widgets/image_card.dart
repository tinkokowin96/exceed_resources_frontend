import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String name;
  final Function() onTap;
  final bool? selected;
  final Function(bool?)? onChanged;
  final String? category;
  const ImageCard({
    Key? key,
    required this.image,
    required this.name,
    required this.onTap,
    this.selected,
    this.onChanged,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.xs),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: AppSize.cardWSm,
                height: AppSize.cardWSm,
              ),
            ),
            const AppContainer(
              width: AppSize.cardWSm,
              height: AppSize.cardWSm,
              borderRadius: AppSize.xs,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black26, Colors.transparent],
              ),
            ),
            if (category != null)
              Positioned(
                top: 0,
                right: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).color.secondary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppSize.xs),
                    ),
                  ),
                  child: SizedBox(
                    width: AppSize.cardcatW,
                    height: AppSize.cardcatH,
                    child: Center(
                      child: Text(
                        category!,
                        style: AppTheme.text(
                          context: context,
                          size: EText.h4,
                          weight: FontWeight.w500,
                          type: ETextType.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: AppSize.sm,
              child: SizedBox(
                width: AppSize.cardWSm,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTheme.text(
                    context: context,
                    weight: FontWeight.w500,
                    type: ETextType.white,
                  ),
                ),
              ),
            ),
            if (selected != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSize.xs, left: AppSize.xs),
                child: SizedBox(
                  width: AppSize.md,
                  height: AppSize.md,
                  child: Checkbox(
                    value: selected!,
                    onChanged: onChanged!,
                    fillColor: MaterialStateProperty.all<Color>(
                      AppTheme.of(context).color.secondary,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
