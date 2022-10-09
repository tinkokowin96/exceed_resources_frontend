import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/size.dart';
import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<String> columns;
  final List<List<Widget>> rows;

  const AppTable({
    Key? key,
    required this.columns,
    this.rows = const [],
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
                style: AppTheme.text(context: context, weight: FontWeight.w500),
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
                border: const TableBorder(
                  verticalInside: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.sm),
                  ),
                ),
                headingRowColor: MaterialStateProperty.resolveWith(
                  (Set states) {
                    return AppTheme.of(context).color.primary.withOpacity(0.7);
                  },
                ),
                columns: tColumns,
                rows: List.from(
                  rows.asMap().entries.map(
                    (item) {
                      final row = item.value;
                      final index = item.key;
                      return DataRow(
                        cells: [
                          ...row.map(
                            (field) => DataCell(
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: AppSize.tCMW,
                                ),
                                child: Center(child: field),
                              ),
                            ),
                          ),
                        ],
                        color: index % 2 == 0
                            ? MaterialStateProperty.resolveWith(
                                (Set states) => Colors.white,
                              )
                            : MaterialStateProperty.resolveWith(
                                (Set states) => AppTheme.of(context).color.primary.withOpacity(0.2),
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
