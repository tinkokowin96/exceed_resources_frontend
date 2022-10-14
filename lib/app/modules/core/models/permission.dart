import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class Permission with _$Permission {
  factory Permission({
    required String name,
    required bool write,
    Map? option,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
}
