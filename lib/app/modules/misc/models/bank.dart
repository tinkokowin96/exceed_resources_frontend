import 'package:exceed_resources_frontend/app/modules/misc/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class Bank with _$Bank {
  factory Bank({
    required String id,
    required String name,
    @JsonKey(name: 'organization_account') required bool origanizationAccount,
    @JsonKey(name: 'owner_id') String? ownerId,
    String? remark,
    @JsonKey(name: 'num_like') required int numLike,
    @Default([]) List<Employee> employees,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
