import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_model.freezed.dart';
part 'type_model.g.dart';

@freezed
class MType with _$MType {
  factory MType({
    @Default('') String id,
    @Default('') String name,
    @Default(ETypeCategory.event) ETypeCategory category,
  }) = _MType;

  factory MType.fromJson(Map<String, dynamic> json) => _$MTypeFromJson(json);
}
