import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<String> columns;
  final Map<String, List<Widget>> rows;
  final Function(String id)? onRowPressed;

  const AppTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.onRowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DataColumn> tColumns = [
      ...columns.map(
        (field) => DataColumn(
          label: Expanded(
            child: Center(
              child: Text(
                field,
                style: AppTheme.text(
                  context: context,
                  weight: FontWeight.w500,
                  type: ETextType.subtitle,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              child: DataTable(
                border: TableBorder(
                  bottom: BorderSide(width: 0.5, color: AppTheme.of(context).color.background),
                  horizontalInside: BorderSide(width: 0.5, color: AppTheme.of(context).color.background),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.sm),
                  ),
                ),
                headingRowColor: MaterialStateProperty.resolveWith(
                  (Set states) {
                    return AppTheme.of(context).color.background;
                  },
                ),
                headingRowHeight: AppSize.thH,
                columns: tColumns,
                rows: List.from(
                  rows.entries.map(
                    (item) {
                      final row = item.value;
                      return DataRow(
                        onSelectChanged: (selected) {
                          if (selected != null && selected && onRowPressed != null) {
                            onRowPressed!(item.key);
                          }
                        },
                        cells: [
                          ...row.map(
                            (field) => DataCell(
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: AppSize.tcMW,
                                ),
                                child: Center(child: field),
                              ),
                            ),
                          ),
                        ],
                        color: MaterialStateProperty.resolveWith(
                          (Set states) => AppTheme.of(context).color.tabeRow,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
