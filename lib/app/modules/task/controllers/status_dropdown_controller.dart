import 'package:exceed_resources_frontend/app/modules/core/models/dropdown_option.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status.dart';
import 'package:get/get.dart';

class StatusDropdownController extends GetxController {
  final List<Status> status;
  final Status initialStatus;
  StatusDropdownController({
    required this.status,
    required this.initialStatus,
  });

  late List<DropdownOption> dropdownOptions = List.from(
    status.map(
      (each) => DropdownOption(
        text: each.text,
        value: each,
      ),
    ),
  );
  late final currentStatus = initialStatus.obs;

  void onDropdownChange(DropdownOption? option) {
    if (option != null) {
      currentStatus.value = option.value;
      currentStatus.refresh();
    }
  }
}
