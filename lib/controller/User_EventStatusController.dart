import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:lobevent_backend/model/User_EventStatus.dart';
import 'package:aqueduct/aqueduct.dart';

class User_EventStatusController extends ResourceController{
  User_EventStatusController(this.context);

  final ManagedContext context;

  @Operation.get('userId')
  Future<Response> getEventsOfInterrest(@Bind.path('userId') int userId) async{
    final usrEvntQuery = Query<User_EventStatus>(context);
    usrEvntQuery.where((h) => h.userId.id).equalTo(userId);
    usrEvntQuery.join(object: (usrEvnt) => usrEvnt.eventId);
    final eventsOfInterest = await usrEvntQuery.fetch();


    return Response.ok(eventsOfInterest);
  }


  @Operation.post('userId')
  Future<Response> insertEventStatus(@Bind.path('userId') int userId) async{
    final user_EventStatus = User_EventStatus()
      ..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<User_EventStatus>(context)..values = user_EventStatus;
    final insertedUser_EventStatus = await query.insert();

    return Response.ok(insertedUser_EventStatus);
  }
}