import 'package:dio/dio.dart';

class Attachment {
  final String? name;
  final String? value;
  final MultipartFile? file;
  bool delete;

  Attachment({
    this.name,
    this.value,
    this.file,
    this.delete = false,
  });
}
