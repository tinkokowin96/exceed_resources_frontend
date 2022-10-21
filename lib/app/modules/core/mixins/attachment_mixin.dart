import 'package:exceed_resources_frontend/app/modules/core/models/attachment_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

mixin AttachmentMixin on GetxController {
  final attachments = Rx<List<AttachmentField>>([]);

  Future<void> updateAttachment({
    required Function(String? data) updateError,
    FilePickerResult? file,
    String? value,
  }) async {
    if (value != null) {
      if (file != null) {
        attachments.value.removeWhere((each) => each.value == value);
      } else {
        AttachmentField removedFile = attachments.value.firstWhere((each) => each.value == value);
        removedFile.delete = true;
      }
    } else if (attachments.value.length < 10) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'csv', 'pdf', 'xls'],
      );
      if (result != null) {
        if (result.files.first.size.isGreaterThan(5242880)) {
          updateError('Maximum Of 5MB Is Allowed');
        } else {
          attachments.value.add(
            AttachmentField(
              name: result.files.first.name,
              value: result.files.first.name,
              file: await dio.MultipartFile.fromFile(
                result.files.first.path ?? '',
                filename: result.files.first.name,
              ),
            ),
          );
        }
      }
    }
    attachments.refresh();
  }
}
