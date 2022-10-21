import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:flutter/foundation.dart';

class Attachment {
  final EAttachmentType type;
  final String name;
  final String? url;
  final Uint8List? data;

  Attachment({required this.type, required this.name, this.url, this.data});
}
