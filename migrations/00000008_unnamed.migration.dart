import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration8 extends Migration { 
  @override
  Future upgrade() async {
   		database.alterColumn("_User_EventStatus", "user", (c) {c.deleteRule = DeleteRule.cascade;});
		database.alterColumn("_User_EventStatus", "event", (c) {c.deleteRule = DeleteRule.cascade;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    