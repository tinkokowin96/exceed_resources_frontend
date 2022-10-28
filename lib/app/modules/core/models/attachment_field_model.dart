import 'dart:io';

class MAttachmentField {
  final String type;
  final String name;
  final String? value;
  final File? file;
  bool delete;

  MAttachmentField({
    required this.type,
    required this.name,
    this.value,
    this.file,
    this.delete = false,
  });
}
