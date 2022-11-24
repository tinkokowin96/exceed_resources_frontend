import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/animated/animated_press.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/button/text_button.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/column.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/filter_field.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/row.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/toggle.dart';
import 'package:exceed_resources_frontend/app/modules/misc/controllers/colleague_listing_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/widgets/colleague_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ColleagueListing extends GetView<ColleagueListingController> {
  final Map<String, List<MColleague>> selectedColleagues;
  final Map<String, List<MColleague>> remainingColleagues;
  final bool exportable;
  final bool showSalary;
  final double? padding;
  final Function({MColleague? colleague, String? departmentId})? onAdd;
  final Function({MColleague? colleague, String? departmentId})? onRemove;
  const ColleagueListing({
    Key? key,
    required this.selectedColleagues,
    required this.remainingColleagues,
    this.exportable = false,
    this.showSalary = false,
    this.onAdd,
    this.onRemove,
    this.padding,
  }) : super(key: key);

  Widget colleagueList({required BuildContext context, bool selected = false}) {
    return Obx(
      () {
        final colleagueList = selected ? controller.selected.value : controller.reamining.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.from(
              colleagueList.values.toList().asMap().entries.map(
                    (department) => Padding(
                      padding: EdgeInsets.only(top: department.key == 0 ? AppSize.sm : AppSize.md),
                      child: AppColumn(
                        spacing: AppSize.sm,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppRow(
                                spacing: AppSize.md,
                                children: [
                                  Text(
                                    department.value[0].departments[0].name,
                                    style: AppTheme.text(
                                      context: context,
                                      size: EText.h2,
                                      type: ETextType.subtitle,
                                    ),
                                  ),
                                  if (onAdd != null)
                                    AppAnimatedPress(
                                      onPressed: () => selected
                                          ? onRemove!(departmentId: department.value[0].departments[0].name)
                                          : onAdd!(departmentId: department.value[0].departments[0].name),
                                      child: SvgPicture.asset(
                                        'assets/icons/${selected ? 'remove' : 'add'}.svg',
                                        width: AppSize.icoMd,
                                      ),
                                    )
                                ],
                              ),
                              if (department.key == 0 && exportable) AppTextButton(onPressed: () {}, text: 'Export')
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.from(
                              department.value.map(
                                (each) {
                                  return Dismissible(
                                    key: ValueKey(each.id),
                                    background: ColoredBox(
                                      color: selected ? Colors.redAccent : AppTheme.of(context).color.secondary,
                                      child: Center(
                                        child: Text(
                                          selected ? 'Remove' : 'Add',
                                          style: AppTheme.text(context: context, type: ETextType.white),
                                        ),
                                      ),
                                    ),
                                    direction: onAdd == null ? DismissDirection.none : DismissDirection.horizontal,
                                    onDismissed: (direction) =>
                                        selected ? onRemove!(colleague: each) : onAdd!(colleague: each),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: AppSize.sm),
                                      child: ColleagueItem(
                                        image: each.image,
                                        name: each.name,
                                        description: each.position.name,
                                        salary: showSalary ? each.basicSalary.toString() : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppSize.sm),
              child: Divider(color: AppTheme.of(context).color.idle),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      ColleagueListingController(
        selectedColleagues,
        remainingColleagues,
      ),
      permanent: false,
    );
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: padding ?? 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppColumn(
                spacing: AppSize.sm,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterField(
                        controller: controller.sortbyController,
                        items: const [
                          MOption(text: 'Salary', value: 'salary'),
                          MOption(text: 'Name', value: 'name'),
                          MOption(text: 'Salary', value: 'salary'),
                        ],
                        title: 'Sort By',
                        onChanged: ({checked, value}) => null,
                      ),
                      Obx(() {
                        return AppToggle(
                          isSelected: controller.sortDirection.value,
                          onSelectionChange: controller.changeSortDirection,
                          disabled: const [],
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
                              child: Text(
                                'Asc',
                                style: AppTheme.text(
                                  context: context,
                                  type: ETextType.primary,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSize.sm),
                              child: Text(
                                'Desc',
                                style: AppTheme.text(
                                  context: context,
                                  type: ETextType.primary,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                  FilterField(
                    controller: controller.departmentController,
                    items: controller.departments,
                    isMulti: true,
                    title: 'Departments',
                    onChanged: ({checked, value}) => null,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.md),
                child: AppColumn(
                  spacing: AppSize.sm,
                  children: [
                    colleagueList(context: context, selected: true),
                    colleagueList(context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
