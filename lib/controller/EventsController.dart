import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:lobevent_backend/model/Event.dart';

class EventsController extends ResourceController {
  EventsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllEvents({@Bind.query('name') String name}) async {
    final eventQuery = Query<Event>(context);

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


}