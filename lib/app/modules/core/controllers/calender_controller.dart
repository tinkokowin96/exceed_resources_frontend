import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/event.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/event_model.dart';
import 'package:get/state_manager.dart';

class CalenderController extends AppController {
  final events = m_events;
  final startYear = 2000;
  final endYear = DateTime.now().year + 10;
  final showEvents = true;
  final picker = false;
  late final List<MOption> yearOptions;
  final selected = Rx<DateTime>(DateTime.now());
  late final currentMonthEvents = Rx<List<MEvent>>(events);
  late final selectedDayEvents = Rxn<List<MEvent>>();
  late final selectedYear = Rx<int>(DateTime.now().year);
  late final selectedMonth = Rx<int>(DateTime.now().month);
  late final selectedDay = Rx<int>(DateTime.now().day);

  void updateYear(MOption? option) {
    if (option != null) {
      selectedYear.value = int.parse(option.value);
      if (selectedMonth.value != 1) {
        selectedMonth.value = 1;
        selectedMonth.refresh();
      }
      selectedDay.value = 1;
      selectedYear.refresh();
      selectedDay.refresh();
    }
  }

  @override
  void onInit() {
    yearOptions = List.generate(
      endYear - startYear,
      (index) {
        final year = (startYear + index).toString();
        return MOption(text: year, value: year);
      },
    );
    super.onInit();
  }
}
