import 'package:exceed_resources_frontend/app/modules/misc/models/event_model.dart';

class MCalenderDay {
  final int day;
  final bool prev;
  final bool next;
  final List<MEvent> events;

  const MCalenderDay({
    required this.day,
    required this.events,
    this.prev = false,
    this.next = false,
  });
}
