import 'package:aqueduct/aqueduct.dart';
import 'dart:async';

class Migration1 extends Migration {
  Future upgrade() async {
    database.createTable(new SchemaTable("_Todo", [
      new SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
      new SchemaColumn("text", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),
    ]));

  }

  Future downgrade() async {
  }
  Future seed() async {
    var todos = [
      "Todo 1",
      "Todo 2"
    ];

    for(var todo in todos)
    {
      await store
        .execute("INSERT INTO _todo (text) VALUES (@text) RETURNING id",
        substitutionValues: {
          "text": todo
        });
    }
  }
}
