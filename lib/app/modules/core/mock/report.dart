import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_model.dart';

final fields = [
  MField(id: 'fe_1', name: 'Date', fieldType: EField.date, value: DateTime.now().add(const Duration(days: 10))),
  MField(id: 'fe_2', name: 'Duration', fieldType: EField.number, value: 6450),
  MField(id: 'fe_3', name: 'Deduced', fieldType: EField.number, value: 100),
  MField(id: 'fe_4', name: 'Earned', fieldType: EField.number, value: 650),
  MField(id: 'fe_5', name: 'Approved By', fieldType: EField.colleague, value: m_colleagues[0]),
  MField(id: 'fe_6', name: 'Deduced By', fieldType: EField.colleague, value: m_colleagues[1]),
  MField(id: 'fe_7', name: 'Name', fieldType: EField.string, value: 'Myanmar Forward'),
  MField(id: 'fe_8', name: 'Percentage', fieldType: EField.number, value: 5),
  MField(id: 'fe_9', name: 'Anniversary Bonus', fieldType: EField.number, value: 3000),
  MField(id: 'fe_10', name: 'Performance Bonus', fieldType: EField.number, value: 1800),
  MField(id: 'fe_11', name: 'Num Overdue', fieldType: EField.number, value: 3),
  MField(id: 'fe_12', name: 'Num Leave', fieldType: EField.number, value: 3),
];

final reportCategories = [
  MReportCategory(
    id: 'rep_cat_1',
    name: 'Overtimes',
    remark:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    fields: [
      [fields[0], fields[4], fields[1], fields[3]],
      [fields[0], fields[4], fields[1], fields[3]],
      [fields[0], fields[4], fields[1], fields[3]],
      [fields[0], fields[4], fields[1], fields[3]],
    ],
  ),
  MReportCategory(
    id: 'rep_cat_2',
    name: 'Earned Projects',
    fields: [
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
    ],
  ),
  MReportCategory(
    id: 'rep_cat_3',
    name: 'Incentive',
    remark:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    fields: [
      [fields[0], fields[8], fields[4], fields[3]],
      [fields[0], fields[9], fields[4], fields[3]],
    ],
  ),
  MReportCategory(
    id: 'rep_cat_4',
    name: 'Late',
    earning: false,
    remark: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    fields: [
      [fields[0], fields[5], fields[1], fields[2]],
      [fields[0], fields[5], fields[1], fields[2]],
      [fields[0], fields[5], fields[1], fields[2]],
      [fields[0], fields[5], fields[1], fields[2]],
    ],
  ),
  MReportCategory(
    id: 'rep_cat_5',
    name: 'Unpaid Leave',
    earning: false,
    fields: [
      [fields[0], fields[5], fields[11], fields[2]],
      [fields[0], fields[5], fields[11], fields[2]],
      [fields[0], fields[5], fields[11], fields[2]],
      [fields[0], fields[5], fields[11], fields[2]],
    ],
  ),
];

final reports = [
  MReport(
    categories: reportCategories,
    basicSalary: 4500,
    totalEarning: 7000,
    totalDeduction: 1200,
  ),
];
