import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_m_model.freezed.dart';
part 'role_m_model.g.dart';

@freezed
class MRoleM with _$MRoleM {
  factory MRoleM({
    required String id,
    required String name,
  }) = _MRoleM;

  factory MRoleM.fromJson(Map<String, dynamic> json) => _$MRoleMFromJson(json);
}
