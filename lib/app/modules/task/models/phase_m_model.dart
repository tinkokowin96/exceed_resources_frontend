import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase_m_model.freezed.dart';
part 'phase_m_model.g.dart';

@freezed
class MPhaseM with _$MPhaseM {
  factory MPhaseM({
    required String id,
    required String name,
  }) = _MPhaseM;

  factory MPhaseM.fromJson(Map<String, dynamic> json) => _$MPhaseMFromJson(json);
}
