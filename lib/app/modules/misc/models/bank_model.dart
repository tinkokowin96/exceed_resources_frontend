import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class MBank with _$MBank {
  factory MBank({
    required String id,
    required String name,
    @JsonKey(name: 'organization_account') required bool origanizationAccount,
    @JsonKey(name: 'owner_id') String? ownerId,
    String? remark,
    @JsonKey(name: 'num_like') required int numLike,
    @Default([]) List<MColleague> colleagues,
  }) = _MBank;

  factory MBank.fromJson(Map<String, dynamic> json) => _$MBankFromJson(json);
}
