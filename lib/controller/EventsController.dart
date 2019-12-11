import 'dart:convert';
import 'dart:math';

import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:lobevent_backend/model/Event.dart';
import 'package:lobevent_backend/model/User_EventStatus.dart';

class EventsController extends ResourceController {
  EventsController(this.context);
  final userId = 1;
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllEvents({@Bind.query('name') String name}) async {
    final eventQuery = Query<Event>(context);
    eventQuery.where((e) => e.usrEvntSts.) .  not.isNotNull();
    /*eventQuery..where((e) => e.usrEvntSts.removeWhere((ues) => ues.user.id != userId)).not.isNotNull()
      ..join(set: (e) => e.usrEvntSts)
      ..where((ues) => ues.user.id).not.equalTo(userId);*/

    if (name != null) {
      eventQuery.where((h) => h.name).contains(name, caseSensitive: false);
    }
    final events = await eventQuery.fetch();

    return Response.ok(events);
  }
  
  @Operation.get('id')
  Future<Response> getEventById(@Bind.path('id') int id) async{
    final eventQuery = Query<Event>(context)
        ..where((h) => h.id).equalTo(id);
    final event = await eventQuery.fetchOne();
    
    if(event == null){
      return Response.notFound();
    }
    return Response.ok(event);
  }

  @Operation.post()
  Future<Response> proccessPostedEvent() async {
    final event = Event()
      ..read(await request.body.decode(), ignore: ["id"]);
    event.user.id = userId;
    final eventQuery = Query<Event>(context)..values = event;
    final insertedEvent = await eventQuery.insert();
    return Response.ok(insertedEvent);
  }

  @Operation.delete("id")
  Future<Response> getMyEvents(@Bind.path('id') int eventId) async{

    final eventDeleteQuery = Query<Event>(context);
    eventDeleteQuery.where((e) => e.id).equalTo(eventId);
    eventDeleteQuery.where((e) => e.user.id).equalTo(userId);
    final deletedEvent = await eventDeleteQuery.delete();
    return Response.ok(deletedEvent);
  }


}