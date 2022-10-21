import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<PermissionRequestResponse> requestPermission({
  required Permission permission,
  required String type,
}) async {
//   const Permission permission = Permission.storage;
  if (type == 'Location') {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return const PermissionRequestResponse(
          granted: false, message: 'Please enable location services to be able to use Exceed Resources');
    }
  }
  if (await permission.status == PermissionStatus.denied) {
    final status = await permission.request();
    if (status != PermissionStatus.granted) {
      return PermissionRequestResponse(granted: false, message: '$type permission is denied.');
    } else {
      return const PermissionRequestResponse(granted: true);
    }
  } else if (await permission.status == PermissionStatus.permanentlyDenied) {
    return PermissionRequestResponse(granted: false, message: '$type permission is denied permanently.');
  }
  return const PermissionRequestResponse(granted: true);
}
