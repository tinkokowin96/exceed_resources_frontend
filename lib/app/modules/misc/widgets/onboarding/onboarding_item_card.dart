import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/container.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/onboarding_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class OnboardingItemCard extends StatelessWidget {
  final MOnboarding data;
  const OnboardingItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = data.article != null
        ? data.article!.image
        : data.attachment!.type == EAttachment.image
            ? data.attachment!.url
            : data.attachment!.thumbnail;
    final type = data.article != null ? 'Article' : data.attachment!.type.name.firstCapitalize();
    final name = data.article != null ? data.article!.title : data.attachment!.name;
    return SizedBox(
      child: InkWell(
        onTap: () {
          final arguments = {
            'title': '',
            'headerTail': AppAnimatedPress(
              onPressed: () => null,
              child: const Icon(Icons.download),
            ),
          };
          if (type == 'Image') {
            arguments['contents'] = CachedNetworkImage(imageUrl: data.attachment!.url!);
          }
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.xs),
              child: CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
                width: AppSize.obcard,
                height: AppSize.obcard,
              ),
            ),
            const AppContainer(
              width: AppSize.obcard,
              height: AppSize.obcard,
              borderRadius: AppSize.xs,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black26, Colors.transparent],
              ),
            ),
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
                  width: AppSize.obcatW,
                  height: AppSize.obcatH,
                  child: Center(
                    child: Text(
                      type,
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
                width: AppSize.obcard,
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
          ],
        ),
      ),
    );
  }
}
