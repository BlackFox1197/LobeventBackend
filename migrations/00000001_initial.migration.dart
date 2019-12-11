import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Event", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false),SchemaColumn("date", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false)]));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
    }
  }
    