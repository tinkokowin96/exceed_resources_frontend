import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

mixin AttachmentMixin on AppController {
  Future<List<AttachmentField>?> updateAttachment({
    required List<AttachmentField> attachments,
    FilePickerResult? file,
    String? value,
  }) async {
    if (value != null) {
      if (file != null) {
        attachments.removeWhere((each) => each.value == value);
      } else {
        AttachmentField removedFile = attachments.firstWhere((each) => each.value == value);
        removedFile.delete = true;
      }
    } else if (attachments.length < 10) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        if (result.files.first.size.isGreaterThan(10485760)) {
          updateError('Maximum Of 10MB Is Allowed');
          return null;
        } else {
          final type = RegExp(r'([a-z]{3,4})$').firstMatch(result.files.first.name)!.group(1);
          attachments.add(
            AttachmentField(
              type: type!,
              name: result.files.first.name,
              value: result.files.first.name,
              file: File(result.files.first.path!),
            ),
          );
        }
      }
    }
    return attachments;
  }
}
