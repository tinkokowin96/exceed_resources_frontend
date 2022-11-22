import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/miscs.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:flutter/material.dart';

class FilterField extends StatelessWidget {
  final String title;
  final Function({bool? checked, MOption? value}) onChanged;
  final TextEditingController controller;
  final List<MOption> items;
  final bool isMulti;
  final double? width;
  const FilterField({
    Key? key,
    required this.controller,
    required this.items,
    required this.title,
    required this.onChanged,
    this.isMulti = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.ftitle,
          child: Text(
            title,
            style: AppTheme.text(
              context: context,
              type: ETextType.subtitle,
              weight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: width ?? AppSize.ffeMd,
          child: AppDropdown(
            items: items,
            onChanged: onChanged,
            dropdownController: controller,
            isMulti: isMulti,
            defaultOption: items[0],
            decoration: AppThemeMiscs.inputStyle(context: context, style: EInputStyle.line),
          ),
        ),
      ],
    );
  }
}
