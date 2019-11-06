import 'package:lobevent_backend/lobevent_backend.dart';

class Event extends ManagedObject<_Event> implements _Event {}

class _Event {
  @primaryKey
  int id;

  @Column(indexed: true)
  String name;

  @Column(indexed: true)
  DateTime date;
}