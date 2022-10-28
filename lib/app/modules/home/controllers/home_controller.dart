import 'package:exceed_resources_frontend/app/modules/core/utils/config.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final permission = permissions.firstWhere((each) => each.name == 'home');
  final currentLocation = Rxn<LatLng>();
  final taskController = Get.find<TaskTableController>();

  Future<void> checkInClickHandler() async {
    if (permission.option!['location']) {
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then(
        (position) {
          currentLocation.value = LatLng(position.latitude, position.longitude);
          currentLocation.refresh();
        },
      );
    }
  }
}
