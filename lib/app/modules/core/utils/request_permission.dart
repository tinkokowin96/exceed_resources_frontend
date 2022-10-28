import 'dart:io';

import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/core/extensions/string_extension.dart';

Future<MPermissionRequestResponse> requestPermission() async {
  if (permissions.firstWhere((each) => each.name == 'home').option!["location"]) {
    if (Platform.isAndroid || Platform.isIOS) {
      final result = await platform.invokeMethod('location');
      if (!result['granted'].toString().parseBool()) {
        return MPermissionRequestResponse(granted: false, message: result['message']);
      }
    }
  }
  if (Platform.isAndroid) {
    final read = await platform.invokeMethod('read');
    if (!read['granted'].toString().parseBool()) {
      return MPermissionRequestResponse(granted: false, message: read['message']);
    }
    final write = await platform.invokeMethod('write');
    if (!write['granted'].toString().parseBool()) {
      return MPermissionRequestResponse(granted: false, message: write['message']);
    }
    final mediaLocation = await platform.invokeMethod('mediaLocation');
    if (!mediaLocation['granted'].toString().parseBool()) {
      return MPermissionRequestResponse(granted: false, message: mediaLocation['message']);
    }
  }

  return const MPermissionRequestResponse(granted: true);
}
