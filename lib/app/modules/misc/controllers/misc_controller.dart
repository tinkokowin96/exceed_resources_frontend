import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:get/get.dart';

class MiscController extends AppController {
  final selectedLanguage = [true, false].obs;
  final darkMode = false.obs;

  void changeLanguage(int index) {
    final selected = selectedLanguage.indexWhere((each) => each);
    if (selected != -1) {
      selectedLanguage[selected] = false;
    }
    selectedLanguage[index] = !selectedLanguage[index];
    selectedLanguage.refresh();
  }

  void toggleDarkMode() {
    darkMode.value = !darkMode.value;
    darkMode.refresh();
  }
}
