import 'dart:convert';

class EventModel {
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? notes;
  String? recurranceRule;

  EventModel({
    this.id,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false, // mặc định
    this.subject = '',
    this.notes,
    this.recurranceRule,
  });

  EventModel copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? notes,
    String? recurranceRule,
  }) {
    return EventModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      notes: notes ?? this.notes,
      recurranceRule: recurranceRule ?? this.recurranceRule,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay, subject: $subject, notes: $notes, recurranceRule: $recurranceRule)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isAllDay == isAllDay &&
        other.subject == subject &&
        other.notes == notes &&
        other.recurranceRule == recurranceRule;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        isAllDay.hashCode ^
        subject.hashCode ^
        notes.hashCode ^
        recurranceRule.hashCode;
  }
}

extension ExitEventModel on EventModel {
  String get formatedStartTimeString =>
      '${startTime.hour}:${startTime.minute}, ${startTime.day}/${startTime.month}/${startTime.year}';
  String get formatedEndTimeString =>
      '${endTime.hour}:${endTime.minute}, ${endTime.day}/${endTime.month}/${endTime.year}';
}
