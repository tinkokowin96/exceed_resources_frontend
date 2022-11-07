import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/circle.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:flutter/material.dart';

class Colleague extends StatelessWidget {
  final MColleagueM colleague;
  final Function({required String id, bool add}) addColleague;
  const Colleague({
    Key? key,
    required this.colleague,
    required this.addColleague,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addColleague(id: colleague.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    AppCircle.image(size: AppSize.md, image: colleague.image),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: colleague.status?.color ?? Colors.greenAccent,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.sm),
                  child: Text(
                    colleague.name,
                    style: AppTheme.text(
                      context: context,
                      size: EText.h4,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.md),
              child: Text(
                colleague.positionName,
                style: AppTheme.text(
                  context: context,
                  size: EText.h4,
                  type: ETextType.subtitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
