import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_model.freezed.dart';
part 'field_model.g.dart';

@freezed
class MField with _$MField {
  factory MField({
    required String name,
    @JsonKey(name: 'field_type') required EField fieldType,
    required dynamic value,
  }) = _MField;

  factory MField.fromJson(Map<String, dynamic> json) => _$MFieldFromJson(json);
}
