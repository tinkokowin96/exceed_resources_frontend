import 'package:exceed_resources_frontend/app/modules/core/models/option.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppPaginator extends StatelessWidget {
  final List<Option> paginatedOptions;
  final int activePage;
  final Function(int page) callback;
  const AppPaginator({
    Key? key,
    required this.paginatedOptions,
    required this.callback,
    required this.activePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.from(
        paginatedOptions.map(
          (each) => Padding(
            padding: const EdgeInsets.only(left: AppSize.sm),
            child: InkWell(
              onTap: () => callback(each.value),
              child: Text(
                each.text,
                style: AppTheme.text(
                  context: context,
                  weight: FontWeight.w500,
                  type: each.value == activePage ? ETextType.body : ETextType.disabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
