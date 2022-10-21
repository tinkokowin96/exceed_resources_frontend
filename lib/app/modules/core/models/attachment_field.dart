import 'package:dio/dio.dart';

class AttachmentField {
  final String? name;
  final String? value;
  final MultipartFile? file;
  bool delete;

  AttachmentField({
    this.name,
    this.value,
    this.file,
    this.delete = false,
  });
}
