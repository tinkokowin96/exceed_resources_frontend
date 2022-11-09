import 'package:cached_network_image/cached_network_image.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/sizebox.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/int_extension.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/comment_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TaskComment extends StatefulWidget {
  final MComment comment;
  final bool divider;
  const TaskComment({
    Key? key,
    required this.comment,
    this.divider = true,
  }) : super(key: key);

  @override
  State<TaskComment> createState() => _TaskCommentState();
}

class _TaskCommentState extends State<TaskComment> {
  @override
  Widget build(BuildContext context) {
    return AppColumn(
      firstNoSpacing: true,
      spacing: AppSize.xs,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppRow(
              spacing: AppSize.sm,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.icoMd / 2),
                  child: CachedNetworkImage(
                    imageUrl: widget.comment.commentedBy.image,
                    width: AppSize.icoMd,
                    height: AppSize.icoMd,
                  ),
                ),
                Text(
                  widget.comment.commentedBy.name,
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                )
              ],
            ),
            AppRow(
              spacing: AppSize.sm,
              firstNoSpacing: true,
              children: [
                Text(
                  (DateTime.now().difference(widget.comment.updatedAt!).inSeconds).countTime(format: true),
                  style: AppTheme.text(
                    context: context,
                    type: ETextType.subtitle,
                  ),
                ),
                AppAnimatedPress(
                  onPressed: () => null,
                  child: Icon(widget.comment.liked ? Icons.favorite : Icons.favorite_border),
                ),
                Text(
                  widget.comment.numLike.toString(),
                  style: AppTheme.text(context: context),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.xs),
          child: widget.comment.commentTexts != null
              ? RichText(
                  text: TextSpan(
                    children: List.from(
                      widget.comment.commentTexts!.map(
                        (each) => TextSpan(
                          text: each.text,
                          style: AppTheme.text(
                            context: context,
                            type: each.colleagueId != null ? ETextType.primary : ETextType.body,
                          ),
                          recognizer: each.colleagueId == null ? null : (TapGestureRecognizer()..onTap = () => ''),
                        ),
                      ),
                    ),
                  ),
                )
              : AppSizeBox.zero,
        ),
        if (widget.divider)
          Padding(
            padding: const EdgeInsets.only(top: AppSize.xs),
            child: Divider(
              color: AppTheme.of(context).color.idle,
            ),
          )
      ],
    );
  }
}
