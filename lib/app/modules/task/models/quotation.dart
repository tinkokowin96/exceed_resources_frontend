import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation.freezed.dart';
part 'quotation.g.dart';

@freezed
class Quotation with _$Quotation {
  factory Quotation({
    required String id,
    required String name,
    required double budget,
    required double expense,
    @Default([]) List<String> resources,
    int? duration,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? remark,
  }) = _Quotation;

  factory Quotation.fromJson(Map<String, dynamic> json) => _$QuotationFromJson(json);
}