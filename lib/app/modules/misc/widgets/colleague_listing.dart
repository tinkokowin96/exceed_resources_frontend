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
  final bool exportable;
  final bool showSalary;
  final bool updatable;
  final bool selectable;
  final Function(MColleague colleague)? onPressed;
  final Function(bool value, MColleague colleague)? onSelectionChange;
  final double? padding;
  const ColleagueListing({
    Key? key,
    this.exportable = false,
    this.showSalary = false,
    this.updatable = false,
    this.selectable = false,
    this.onPressed,
    this.onSelectionChange,
    this.padding,
  }) : super(key: key);

  Widget colleagueList({required BuildContext context, bool selected = false}) {
    return Obx(
      () {
        final colleagueList = selected ? controller.selectedColleagues.value : controller.remainingColleagues.value;
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
                                  if (updatable)
                                    AppAnimatedPress(
                                      onPressed: () => selected
                                          ? controller.updateColleague(
                                              add: false,
                                              departmentId: department.value[0].departments[0].id,
                                            )
                                          : controller.updateColleague(
                                              departmentId: department.value[0].departments[0].id,
                                            ),
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
                                    direction: updatable ? DismissDirection.horizontal : DismissDirection.none,
                                    onDismissed: (direction) => selected
                                        ? controller.updateColleague(add: false, colleague: each)
                                        : controller.updateColleague(colleague: each),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: AppSize.sm),
                                      child: ColleagueItem(
                                        image: each.image,
                                        name: each.name,
                                        description: each.position.name,
                                        salary: showSalary ? each.basicSalary.toString() : null,
                                        selected: false,
                                        onChanged: (value) {
                                          if (value != null) {
                                            onSelectionChange!(value, each);
                                          }
                                        },
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
      ColleagueListingController(),
      permanent: false,
    );
    return Padding(
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
                    Obx(
                      () {
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
                      },
                    )
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
    );
  }
}
