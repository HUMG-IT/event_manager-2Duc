import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'event_model.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    final item = appointments!.elementAt(index);
    return item.startTime;
  }

  @override
  DateTime getEndTime(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.endTime;
  }

  @override
  DateTime getSubject(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.subject;
  }
  @override
  bool isAllDay(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.isAllDay;
  }

  @override
  String? getNotes(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.notes;
  }
  @override
  String? getRecurranceRule(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.recurranceRule;
  } 
  @override
  Color getColor(int index) {
    EventModel item = appointments!.elementAt(index);
    return item.isAllDay ? const Color(0xFF0F8644) : super getColor(index);
  }
}
