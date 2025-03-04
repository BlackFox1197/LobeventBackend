import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:lobevent_backend/model/Event.dart';
import 'package:lobevent_backend/model/User_EventStatus.dart';
import 'package:aqueduct/aqueduct.dart';

class User_EventStatusController extends ResourceController{
  User_EventStatusController(this.context);

  final ManagedContext context;

  @Operation.get('userId')
  Future<Response> getEventsOfInterrest(@Bind.path('userId') int userId) async{
    final usrEvntQuery = Query<User_EventStatus>(context);
    usrEvntQuery.where((h) => h.user.id).equalTo(userId);
    usrEvntQuery.where((usrEvntSts) => usrEvntSts.status).equalTo(0);
    usrEvntQuery.join(object: (usrEvnt) => usrEvnt.event);
    final eventUserStatusOfInterest = await usrEvntQuery.fetch();
    List<Event> eventsOfInterrest = eventUserStatusOfInterest.map((u) => u.event).toList();
    return Response.ok(eventsOfInterrest);
  }




  @Operation.post('userId')
  Future<Response> insertEventStatus(@Bind.path('userId') int userId) async{
    final user_EventStatus = User_EventStatus()//TODO: Add userid to query
      ..read(await request.body.decode(), ignore: ["id"]);
    user_EventStatus.user.id = userId;
    final query = Query<User_EventStatus>(context)..values = user_EventStatus;
    final insertedUser_EventStatus = await query.insert();
    print(insertedUser_EventStatus.toString());

    return Response.ok(insertedUser_EventStatus);
  }
}