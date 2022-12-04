import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colleague_report_model.freezed.dart';
part 'colleague_report_model.g.dart';

@freezed
class MColleagueReport with _$MColleagueReport {
  factory MColleagueReport({
    @Default('') String id,
    @Default('') String report,
    MColleague? colleague,
    @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime? date,
  }) = _MColleagueReport;

  factory MColleagueReport.fromJson(Map<String, dynamic> json) => _$MColleagueReportFromJson(json);
}
