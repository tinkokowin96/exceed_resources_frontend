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
  late final monthDays = Rx<List<Map<String, bool>>>([]);

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
      getDays();
    }
  }

  void updateMonth(int value) {
    selectedMonth.value = value;
    selectedMonth.refresh();
  }

  void getDays() {
    monthDays.value = [];
    for (int month = 1; month < 13; month++) {
      final Map<String, bool> days = {};
      DateTime? prevLastDayDate;
      final firstDayDate = DateTime(selectedYear.value, month, 1);
      final lastDayDate = DateTime(selectedYear.value, month + 1, 0);
      final firstDayWeekday = firstDayDate.weekday;
      final lastDayWeekday = lastDayDate.weekday;

      if (firstDayWeekday != 1) {
        final prevMonth = month == 1 ? 12 : month - 1;
        final prevYear = month == 1 ? selectedYear.value - 1 : selectedYear.value;
        prevLastDayDate = DateTime(prevYear, prevMonth + 1, 0);
        for (int i = firstDayWeekday - 1; i > 0; i--) {
          days['${prevLastDayDate.day - i}a'] = false;
        }
      }
      for (int i = 1; i < lastDayDate.day + 1; i++) {
        days[i.toString()] = true;
      }
      if (lastDayWeekday != 7) {
        for (int i = 1; i < 8 - lastDayWeekday; i++) {
          days['${i}a'] = false;
        }
      }
      monthDays.value.add(days);
    }

    monthDays.refresh();
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
    getDays();
    super.onInit();
  }
}
