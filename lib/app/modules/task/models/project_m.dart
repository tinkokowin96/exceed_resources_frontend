import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_m.freezed.dart';
part 'project_m.g.dart';

@freezed
class ProjectM with _$ProjectM {
  factory ProjectM({
    required String id,
    required String name,
  }) = _ProjectM;

  factory ProjectM.fromJson(Map<String, dynamic> json) => _$ProjectMFromJson(json);
}
