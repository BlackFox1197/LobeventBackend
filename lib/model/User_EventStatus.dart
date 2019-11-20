import 'package:lobevent_backend/lobevent_backend.dart';
import 'Event.dart';
import 'User.dart';

class User_EventStatus extends ManagedObject<_User_EventStatus> implements _User_EventStatus{

}

class _User_EventStatus {

  @primaryKey
  int id;

  @Relate(#usrEvntSts)
  User userId;

  @Relate(#usrEvntSts)
  Event eventId;

  @Column(indexed: true)
  int status;
}