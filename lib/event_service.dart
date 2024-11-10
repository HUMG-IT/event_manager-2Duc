import 'package:event_manager/event/event_model.dart';
import 'package:localstore/localstore.dart';

class EventService {
  final db = localstore.getInstance(userSupportDir: true);

  final path = 'event';

  Future<List<EventModel>> getAllEvents() async {
    final eventsMap = await db.collection(path).get();

    if (eventsMap != null) {
      return eventsMap.entries.map((entry) {
        final eventData = entry.value as Map<String, dynamic>;
        if (!eventData.containsKey('id')) {
          eventData['id'] = entry.key.split('/').last;
        }
        return EventModel.fromMap(eventsMap);
      }).toList();
    }
    return [];
  }
}

Future<void> saveEvent(EventModel item) async {
  item.id ??= db.collection(path).doc().id;
  await db.collection(path).doc(item.id).set(item.toMap());
}
