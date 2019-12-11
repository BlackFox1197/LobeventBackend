import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration5 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_Event", SchemaColumn.relationship("user", ManagedPropertyType.bigInteger, relatedTableName: "_User", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_User_EventStatus", SchemaColumn.relationship("user", ManagedPropertyType.bigInteger, relatedTableName: "_User", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_User_EventStatus", SchemaColumn.relationship("event", ManagedPropertyType.bigInteger, relatedTableName: "_Event", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.deleteColumn("_User_EventStatus", "userId");
		database.deleteColumn("_User_EventStatus", "eventId");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
    final events = [["Fuchsparty", "2016-06-22 19:10:25-07", 1], ["Ausgenocked", "2016-06-22 19:10:25-07", 2], ["Pissparty", "2016-06-22 19:10:25-07", 1], ["Niggerhandel", "2016-06-22 19:10:25-07", 1]];

    for (final event in events) {
      await database.store.execute("INSERT INTO _event (name, date, user_id) Values (@name, @date, @user_id)", substitutionValues: {
        "name" : event[0],
        "date" : event[1],
        "user_id": event[2]});
    }
  }
}
    