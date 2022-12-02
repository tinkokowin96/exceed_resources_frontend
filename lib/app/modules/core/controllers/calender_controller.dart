import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/event.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/calender_day_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/option_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/calender/calender_event_popup.dart';
import 'package:exceed_resources_frontend/app/modules/core/widgets/popup.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/event_model.dart';
import 'package:get/state_manager.dart';

class CalenderController extends AppController {
  final startYear = 2000;
  final endYear = DateTime.now().year + 10;
  final showEvents = true;
  final picker = false;
  final rangePicker = false;
  final rangeStartPicked = false.obs;
  final rangeStartDate = Rxn<DateTime>();
  final rangeEndDate = Rxn<DateTime>();
  late final List<MOption> yearOptions;
  final today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final selected = Rx<DateTime>(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  final selectedDayEvents = Rx<List<MEvent>>([]);
  late final selectedYear = Rx<int>(DateTime.now().year);
  late final selectedMonth = Rx<int>(DateTime.now().month);
  late final monthDays = Rx<List<List<MCalenderDay>>>([]);

  void updateYear(MOption? option) {
    if (option != null) {
      selectedYear.value = int.parse(option.value);
      if (selectedMonth.value != 1) {
        selectedMonth.value = 1;
        selectedMonth.refresh();
      }
      selectedYear.refresh();
      getDays();
    }
  }

  void updateMonth(int value) {
    selectedMonth.value = value;
    selectedMonth.refresh();
  }

  void selectDate(DateTime date, List<MEvent> selectedEvents) {
    selected.value = date;
    selectedDayEvents.value = selectedEvents;
    selected.refresh();
    selectedDayEvents.refresh();
  }

  void pickRange(DateTime date) {
    if (rangeStartPicked.isFalse) {
      rangeEndDate.value = null;
      rangeStartDate.value = date;
      rangeStartPicked.value = true;
      rangeStartDate.refresh();
      rangeEndDate.refresh();
    } else {
      rangeEndDate.value = date;
      rangeStartPicked.value = false;
      rangeEndDate.refresh();
    }
  }

  bool checkDateInRange(DateTime date, DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      final rangeStart = startDate.millisecondsSinceEpoch;
      final rangeEnd = endDate.millisecondsSinceEpoch;
      final check = date.millisecondsSinceEpoch;
      final start = rangeStart < rangeEnd ? rangeStart : rangeEnd;
      final end = rangeStart > rangeEnd ? rangeStart : rangeEnd;
      if (start <= check && end >= check) {
        return true;
      }
      return false;
    }
    return false;
  }

  int getDisabledMonthYear({
    required int checkMonth,
    required bool prev,
    bool month = true,
  }) {
    if (month) {
      if (prev) {
        return checkMonth == 0 ? 12 : checkMonth;
      } else {
        return checkMonth == 11 ? 1 : checkMonth + 2;
      }
    } else {
      if (prev) {
        return checkMonth == 0 ? selectedYear.value - 1 : selectedYear.value;
      } else {
        return checkMonth == 11 ? selectedYear.value + 1 : selectedYear.value;
      }
    }
  }

  List<MEvent> getEvents(DateTime date) => m_events
      .where(
        (each) =>
            each.effectiveDate == selected.value ||
            checkDateInRange(
              date,
              each.effectiveDate,
              each.endDate,
            ),
      )
      .toList();

  void getDays() {
    monthDays.value = [];
    for (int month = 1; month < 13; month++) {
      final List<MCalenderDay> days = [];
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
          days.add(MCalenderDay(day: prevLastDayDate.day - i, events: [], prev: true));
        }
      }
      for (int i = 1; i < lastDayDate.day + 1; i++) {
        final events = getEvents(DateTime(selectedYear.value, month + 1, i));
        days.add(MCalenderDay(day: i, events: events));
      }
      if (lastDayWeekday != 7) {
        for (int i = 1; i < 8 - lastDayWeekday; i++) {
          days.add(MCalenderDay(day: i, events: [], next: true));
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
