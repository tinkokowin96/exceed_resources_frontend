import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/dropdown/dropdown.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:flutter/material.dart';

class ColleagueListing extends StatelessWidget {
  final List<MColleagueM> selectedColleagues;
  final List<MColleagueM> remainingColleagues;
  final bool exportable;
  final bool updatable;
  final bool showSalary;
  const ColleagueListing({
    Key? key,
    required this.selectedColleagues,
    required this.remainingColleagues,
    this.exportable = false,
    this.updatable = false,
    this.showSalary = false,
  }) : super(key: key);

  Widget colleagueList({bool selected = false}) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppRow(
                spacing: AppSize.md,
                children: [
                  AppDropdown(items: const [
                    MOption(text: 'Salary', value: 'salary'),
                    MOption(text: 'Name', value: 'name'),
                    MOption(text: 'Salary', value: 'salary'),
                  ], onChanged: onChanged)
                ],
              ),
              if (exportable) AppTextButton(onPressed: () => null, text: 'Export')
            ],
          ),
          Expanded(child: colleagueList(selected: true)),
          Expanded(child: colleagueList()),
        ],
      ),
    );
  }
}
