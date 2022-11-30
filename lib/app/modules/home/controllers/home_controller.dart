import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends AppController {
  final currentLocation = Rxn<LatLng>();
  final taskController = Get.find<TaskTableController>(tag: 'home');

  Future<void> checkInClickHandler() async {
    if (currentLocation.value != null) {
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then(
        (position) {
          currentLocation.value = LatLng(position.latitude, position.longitude);
          currentLocation.refresh();
        },
      );
    }
  }
}
