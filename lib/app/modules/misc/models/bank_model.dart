import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class MBank with _$MBank {
  factory MBank({
    @Default('') String id,
    @Default('') String name,
    @Default(false) @JsonKey(name: 'organization_account') bool origanizationAccount,
    @Default([]) List<MColleague> colleagues,
    MColleague? owner,
    @Default('') String remark,
  }) = _MBank;

  factory MBank.fromJson(Map<String, dynamic> json) => _$MBankFromJson(json);
}
