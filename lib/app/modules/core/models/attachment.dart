import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  factory Attachment({
    required EAttachmentType type,
    required String name,
    String? url,
    dynamic data, //null on data comes from api
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}
