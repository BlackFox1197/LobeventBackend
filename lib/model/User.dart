

import 'package:aqueduct/managed_auth.dart';
import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:lobevent_backend/model/User_EventStatus.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {}

class _User extends ResourceOwnerTableDefinition {

  ManagedSet<User_EventStatus> usrEvntSts;
}