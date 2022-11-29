import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@freezed
class MPermission with _$MPermission {
  factory MPermission({
    @Default('') String name,
    @Default(false) bool write,
    Map? option,
  }) = _MPermission;

  factory MPermission.fromJson(Map<String, dynamic> json) => _$MPermissionFromJson(json);
}
