import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

mixin AttachmentMixin on AppController {
  Future<List<MAttachmentField>?> updateAttachment({
    required List<MAttachmentField> attachments,
    String? name,
  }) async {
    if (name != null) {
      MAttachmentField removedFile = attachments.firstWhere((each) => each.name == name);
      if (removedFile.file == null) {
        removedFile.delete = true;
      } else {
        attachments.removeWhere((each) => each.name == removedFile.name);
      }
    } else if (attachments.length < 10) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        if (result.files.first.size.isGreaterThan(10485760)) {
          updateError('Maximum of 10MB is allowed');
          return null;
        } else {
          final type = RegExp(r'([a-z]{3,4})$').firstMatch(result.files.first.name)!.group(1);
          attachments.add(
            MAttachmentField(
              type: type!,
              name: result.files.first.name,
              value: result.files.first.name,
              file: File(result.files.first.path!),
            ),
          );
        }
      }
    } else {
      updateError('Maximum of 10 resources is allowed');
    }
    return attachments;
  }
}
