import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTableController extends GetxController {
  final BuildContext context;
  TaskTableController({
    required this.context,
  });

  final statusController = TextEditingController();
  final columns = ['Task Name', 'Due Date', 'Project'];
  final status = [
    {'text': 'progress', 'color': const Color(0xFFE78567)},
    {'text': 'deploy', 'color': const Color(0xFFE8CE8E)},
    {'text': 'complete', 'color': const Color(0xFF85B270)},
  ];
  late final List<List<Widget>> rows = [
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Change hero image',
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context, size: EText.h4),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFE78567),
              borderRadius: BorderRadius.circular(AppSize.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.sm, vertical: AppSize.xs),
              child: SizedBox(
                child: Text(
                  'progress',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h5,
                    type: ETextType.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Text(
        'Mon, 7/12/22',
        style: AppTheme.text(context: context, size: EText.h4),
      ),
      Text(
        'Myanamar Eastern Project',
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(context: context, size: EText.h4),
      ),
    ],
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Clear padding in the home page and follow the instructions',
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context, size: EText.h4),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFE78567),
              borderRadius: BorderRadius.circular(AppSize.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.sm,
                vertical: AppSize.xs,
              ),
              child: SizedBox(
                child: Text(
                  'progress',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h5,
                    type: ETextType.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Text(
        'Mon, 7/12/22',
        style: AppTheme.text(context: context, size: EText.h4),
      ),
      Text(
        'Super Boys Project',
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(context: context, size: EText.h4),
      ),
    ],
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "Lorem Ipsum has been the industry's standard",
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context, size: EText.h4),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF85B270),
              borderRadius: BorderRadius.circular(AppSize.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.sm,
                vertical: AppSize.xs,
              ),
              child: SizedBox(
                child: Text(
                  'complete',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h5,
                    type: ETextType.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Text(
        'Mon, 7/12/22',
        style: AppTheme.text(context: context, size: EText.h4),
      ),
      Text(
        'Myanamar Eastern Project',
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(context: context, size: EText.h4),
      ),
    ],
    [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'There are many variations of passages of Lorem Ipsum available',
              overflow: TextOverflow.ellipsis,
              style: AppTheme.text(context: context, size: EText.h4),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFE8CE8E),
              borderRadius: BorderRadius.circular(AppSize.lg),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.sm,
                vertical: AppSize.xs,
              ),
              child: SizedBox(
                child: Text(
                  'deploy',
                  style: AppTheme.text(
                    context: context,
                    size: EText.h5,
                    type: ETextType.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Text(
        'Mon, 7/12/22',
        style: AppTheme.text(context: context, size: EText.h4),
      ),
      Text(
        'Myanamar Eastern Project',
        overflow: TextOverflow.ellipsis,
        style: AppTheme.text(context: context, size: EText.h4),
      ),
    ],
  ];
}
