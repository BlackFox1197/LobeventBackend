import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:lobevent_backend/model/Event.dart';

class UserEventController extends ResourceController {
  UserEventController(this.context);
  final userId = 1;

  final ManagedContext context;
  @Operation.get()
  Future<Response> getMyEvents() async{
      final eventQuery = Query<Event>(context)..where((h) => h.user.id).equalTo(userId);
      final events = await eventQuery.fetch();
      return Response.ok(events);
  }



}