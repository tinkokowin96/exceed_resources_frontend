import 'package:exceed_resources_frontend/app/modules/core/models/permission_request_response.dart';
import 'package:geolocator/geolocator.dart';

Future<PermissionRequestResponse> requestLocationPermission() async {
  LocationPermission permission;
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return const PermissionRequestResponse(
        granted: false, message: 'Please enable location services to be able to use Exceed Resources');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied) {
    return const PermissionRequestResponse(granted: false, message: 'Location permissions are denied.');
  }

  if (permission == LocationPermission.deniedForever) {
    return const PermissionRequestResponse(
        granted: false,
        message: "Location permissions are denied  and Exceed Resources can't run without location permissions.");
  }

  return const PermissionRequestResponse(granted: true);
}
