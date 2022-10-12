import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:exceed_resources_frontend/app/modules/task/widgets/status_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTableController extends GetxController {
  late final BuildContext context;
  final statusController = TextEditingController();
  final detailPage = false.obs;
  final activePage = 0.obs;
  final paginatedOptions = List.generate(
    5,
    (index) => Option(
      text: (index + 1).toString(),
      value: index,
    ),
  ).obs;
  final columns = ['Task Name', 'Due Date', 'Project'];
  final status = [
    Status(id: '1', text: 'progress', color: const Color(0xFFE78567)),
    Status(id: '2', text: 'deploy', color: const Color(0xFFE8CE8E)),
    Status(id: '3', text: 'complete', color: const Color(0xFF85B270)),
  ];

  void updatePage(int page) {
    final ser = status[0].toJson();
    activePage.value = page;
    activePage.refresh();
  }

  List<List<Widget>> getRows(BuildContext context) {
    return [
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
            StatusDropdown(
              status: status,
              initialStatus: status[0],
            )
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
            StatusDropdown(
              status: status,
              initialStatus: status[0],
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
            StatusDropdown(
              status: status,
              initialStatus: status[1],
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
            StatusDropdown(
              status: status,
              initialStatus: status[2],
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
}
