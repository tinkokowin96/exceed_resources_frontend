import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_model.freezed.dart';
part 'extra_model.g.dart';

@freezed
class MExtra with _$MExtra {
  factory MExtra({
    @Default(false) bool point, //point | salary
    @Default(false) bool percent, //percent | absolute
    double? value,
  }) = _MExtra;

  factory MExtra.fromJson(Map<String, dynamic> json) => _$MExtraFromJson(json);
}
