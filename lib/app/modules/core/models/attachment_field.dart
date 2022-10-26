import 'dart:io';

class AttachmentField {
  final String type;
  final String name;
  final String? value;
  final File? file;
  bool delete;

  AttachmentField({
    required this.type,
    required this.name,
    this.value,
    this.file,
    this.delete = false,
  });
}
