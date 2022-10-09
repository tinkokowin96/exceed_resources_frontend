import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final currentLocation = Rxn<LatLng>();

  Future<void> checkInClickHandler() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then(
      (position) {
        currentLocation.value = LatLng(position.altitude, position.latitude);
        currentLocation.refresh();
      },
    );
  }
}
