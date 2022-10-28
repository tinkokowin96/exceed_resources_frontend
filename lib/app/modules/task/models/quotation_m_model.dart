import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_m_model.freezed.dart';
part 'quotation_m_model.g.dart';

@freezed
class MQuotationM with _$MQuotationM {
  factory MQuotationM({
    required String id,
    required String name,
  }) = _MQuotationM;

  factory MQuotationM.fromJson(Map<String, dynamic> json) => _$MQuotationMFromJson(json);
}
