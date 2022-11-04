import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/animations/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Participant extends StatelessWidget {
  final MColleagueM colleague;
  final Function() onDelete;
  const Participant({
    Key? key,
    required this.colleague,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(imageUrl: colleague.image),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: AppAnimatedPress(
              onPressed: onDelete,
              child: SvgPicture.asset(
                'assets/icons/remove.svg',
                width: 12,
                height: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
