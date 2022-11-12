import 'package:exceed_resources_frontend/app/modules/core/mock/colleague.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/field_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_category_model.dart';
import 'package:exceed_resources_frontend/app/modules/report/models/report_model.dart';

final fields = [
  MField(name: 'Date', fieldType: EField.date, value: DateTime.now().add(const Duration(days: 10))),
  MField(name: 'Duration', fieldType: EField.number, value: 6450),
  MField(name: 'Deduced', fieldType: EField.number, value: 100),
  MField(name: 'Earned', fieldType: EField.number, value: 650),
  MField(name: 'Approved By', fieldType: EField.colleague, value: m_colleagues[0]),
  MField(name: 'Deduced By', fieldType: EField.colleague, value: m_colleagues[1]),
  MField(name: 'Name', fieldType: EField.string, value: 'Myanmar Forward'),
  MField(name: 'Percentage', fieldType: EField.number, value: 5),
  MField(name: 'Anniversary Bonus', fieldType: EField.number, value: 3000),
  MField(name: 'Performance Bonus', fieldType: EField.number, value: 1800),
  MField(name: 'Num Overdue', fieldType: EField.number, value: 3),
  MField(name: 'Num Leave', fieldType: EField.number, value: 3),
];

final reportCategories = [
  MReportCategory(
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
    name: 'Earned Projects',
    fields: [
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
      [fields[0], fields[6], fields[4], fields[7], fields[3]],
    ],
  ),
  MReportCategory(
    name: 'Incentive',
    remark:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    fields: [
      [fields[0], fields[8], fields[4], fields[3]],
      [fields[0], fields[9], fields[4], fields[3]],
    ],
  ),
  MReportCategory(
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
    categories: [
      reportCategories[0],
      reportCategories[1],
      reportCategories[2],
    ],
    basicSalary: 4500,
  ),
  MReport(
    earning: false,
    categories: [
      reportCategories[3],
      reportCategories[4],
      reportCategories[5],
    ],
    basicSalary: 4500,
  ),
];
