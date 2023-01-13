import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/comment.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/detail/detail_section.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/review_model.dart';
import 'package:flutter/material.dart';

class DetailComments extends StatelessWidget {
  final AppController controller;
  final List<MReview> comments;
  final Widget allComments;
  final bool showLike;
  const DetailComments({
    Key? key,
    required this.controller,
    required this.comments,
    required this.allComments,
    this.showLike = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailSection(
      title: 'Comments',
      direction: Axis.vertical,
      detailWidget: AppColumn(
        spacing: AppSize.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppComment(
            comment: comments[0],
            divider: false,
            showLike: showLike,
          ),
          InkWell(
            onTap: () => controller.showDrawer(widget: allComments),
            child: Text(
              'See all ${comments.length} comments',
              style: AppTheme.text(
                context: context,
                type: ETextType.subtitle,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
