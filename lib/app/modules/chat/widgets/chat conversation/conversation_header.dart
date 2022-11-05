import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/chat/controllers/chat_conversation_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConversationHeader extends StatelessWidget {
  final String image;
  final String name;
  final int numColleague;
  const ConversationHeader({
    Key? key,
    required this.image,
    required this.name,
    required this.numColleague,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 60,
                height: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.sm),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTheme.text(
                      context: context,
                      size: EText.h2,
                      weight: FontWeight.w500,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: numColleague.toString(),
                      style: AppTheme.text(context: context, type: ETextType.subtitle),
                      children: [
                        TextSpan(
                          text: ' colleagues',
                          style: AppTheme.text(
                            context: context,
                            type: ETextType.subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppAnimatedPress(
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/icons/call.svg',
                color: AppTheme.of(context).color.idle,
                width: AppSize.icoMd,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.sm),
              child: AppAnimatedPress(
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  color: AppTheme.of(context).color.idle,
                  width: AppSize.icoMd,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
