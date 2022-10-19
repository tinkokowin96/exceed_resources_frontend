import 'package:freezed_annotation/freezed_annotation.dart';

part 'phase_m.freezed.dart';
part 'phase_m.g.dart';

@freezed
class PhaseM with _$PhaseM {
  factory PhaseM({
    required String id,
    required String name,
  }) = _PhaseM;

  factory PhaseM.fromJson(Map<String, dynamic> json) => _$PhaseMFromJson(json);
}
