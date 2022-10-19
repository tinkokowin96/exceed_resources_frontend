import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_m.freezed.dart';
part 'role_m.g.dart';

@freezed
class RoleM with _$RoleM {
  factory RoleM({
    required String id,
    required String name,
  }) = _RoleM;

  factory RoleM.fromJson(Map<String, dynamic> json) => _$RoleMFromJson(json);
}
