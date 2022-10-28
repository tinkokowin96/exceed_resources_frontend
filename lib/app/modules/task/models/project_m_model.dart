import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_m_model.freezed.dart';
part 'project_m_model.g.dart';

@freezed
class MProjectM with _$MProjectM {
  factory MProjectM({
    required String id,
    required String name,
  }) = _MProjectM;

  factory MProjectM.fromJson(Map<String, dynamic> json) => _$MProjectMFromJson(json);
}
