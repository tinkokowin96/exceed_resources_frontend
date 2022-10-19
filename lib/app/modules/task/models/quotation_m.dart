import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_m.freezed.dart';
part 'quotation_m.g.dart';

@freezed
class QuotationM with _$QuotationM {
  factory QuotationM({
    required String id,
    required String name,
  }) = _QuotationM;

  factory QuotationM.fromJson(Map<String, dynamic> json) => _$QuotationMFromJson(json);
}
