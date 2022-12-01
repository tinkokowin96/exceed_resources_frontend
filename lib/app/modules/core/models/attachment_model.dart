import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
class MAttachment with _$MAttachment {
  factory MAttachment({
    @Default(EAttachment.image) EAttachment type,
    @Default('') String name,
    @Default('') String thumbnail,
    @Default('') String url,
    dynamic data,
  }) = _MAttachment;

  factory MAttachment.fromJson(Map<String, dynamic> json) => _$MAttachmentFromJson(json);
}
