import 'dart:async';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/services/byte_response_service.dart';
import 'package:exceed_resources_frontend/app/modules/core/theme/index.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:path_provider/path_provider.dart';

EDevice getDevice(BuildContext context) => MediaQuery.of(context).size.width <= 576
    ? EDevice.mobile
    : MediaQuery.of(context).size.width <= 768
        ? EDevice.tablet
        : EDevice.desktop;

Color getTextColor(ETextType type, BuildContext context) {
  switch (type) {
    case ETextType.error:
      return AppTheme.of(context).color.error;

    case ETextType.primary:
      return AppTheme.of(context).color.secondary;

    case ETextType.white:
      return Colors.white;

    case ETextType.subtitle:
      return AppTheme.of(context).color.idle;

    case ETextType.disabled:
      return AppTheme.of(context).color.disabled;

    default:
      return AppTheme.of(context).color.body;
  }
}

double getFontSize(EText size, BuildContext context) {
  final device = getDevice(context);

  switch (size) {
    case EText.h1:
      return device == EDevice.mobile
          ? 18
          : device == EDevice.tablet
              ? 20
              : 22;
    case EText.h2:
      return device == EDevice.mobile
          ? 16
          : device == EDevice.tablet
              ? 18
              : 20;
    case EText.h3:
      return device == EDevice.mobile
          ? 14
          : device == EDevice.tablet
              ? 16
              : 18;
    case EText.h5:
      return device == EDevice.mobile
          ? 10
          : device == EDevice.tablet
              ? 12
              : 14;
    default:
      return device == EDevice.mobile
          ? 12
          : device == EDevice.tablet
              ? 14
              : 16;
  }
}

String formatDate({DateTime? date, String? dateString}) {
  final inputDate = date ?? DateTime.parse(dateString!);
  String formattedDate = '${inputDate.day} ';
  late final String month;
  switch (inputDate.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
  }
  formattedDate += month;
  formattedDate += ' ${inputDate.year}';
  return formattedDate;
}

String transfromName(String name) => name[0] + RegExp(r' (.)').firstMatch(name)!.group(1)!.toUpperCase();

Future<void> download(
    {required List<MAttachment> attachments, required AppController controller, required BuildContext context}) async {
  if (directory == null) {
    if (Platform.isIOS) {
      final appDoc = await getApplicationDocumentsDirectory();
      directory = appDoc.path;
    } else if (Platform.isAndroid) {
      final appDir = Directory('/storage/emulated/0/Download/exceed_resources');
      if (!await appDir.exists()) {
        appDir.create(recursive: true);
      }
      directory = appDir.path;
    } else {
      final pickerRes = await FilePicker.platform.getDirectoryPath();
      directory = pickerRes;
    }
  }

  Future<void> downloadFile() async {
    controller.updateLoading(value: true);
    late final Uint8List bytes;
    late final String name;
    if (attachments.length == 1) {
      name = attachments[0].name;
      if (attachments[0].url == null) {
        bytes = attachments[0].data!;
      } else {
        bytes = await byteResponse(attachments[0].url!);
      }
    } else {
      final encoder = ZipEncoder();
      final archive = Archive();
      for (final file in attachments) {
        late final Uint8List fileByte;
        if (file.data != null) {
          fileByte = file.data!;
        } else {
          fileByte = await byteResponse(file.url!);
        }
        ArchiveFile archiveFile = ArchiveFile.stream(
          file.name,
          fileByte.lengthInBytes,
          InputStream(fileByte),
        );
        archive.addFile(archiveFile);
      }
      name = 'attachments.zip';
      bytes = encoder.encode(archive, level: Deflate.BEST_COMPRESSION, output: OutputStream(byteOrder: LITTLE_ENDIAN))
          as Uint8List;
    }

    await File('$directory/$name').writeAsBytes(bytes);
    controller.updateLoading(value: false);
    Get.showSnackbar(
      GetSnackBar(
        title: 'MAttachment Downloaded',
        message: '$name is download ${!Platform.isIOS ? 'into $directory' : ''}',
      ),
    );
  }

  if (attachments.length == 1 && await File('$directory/${attachments[0].name}').exists()) {
    controller.showPopup(
      popupWidget: AppPopup.info(
        context: context,
        controller: controller,
        title: 'MAttachment already downloaded',
        info: 'This attachment is already downloaded before.\nAre you sure you want to download again.',
      ),
      confirm: () => downloadFile(),
    );
  } else {
    downloadFile();
  }
}

class App {
  static width(BuildContext context) => MediaQuery.of(context).size.width;
  static height(BuildContext context) => MediaQuery.of(context).size.height;
}
