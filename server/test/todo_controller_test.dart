import 'package:test/test.dart';
import 'package:dart_todo_server/todo.dart';

void main()
{
  var app = new Application<TodoRequestSink>();
  var client = new TestClient(app);

  setUpAll(() async {
    await app.start(runOnMainIsolate: true);

    var context = ManagedContext.defaultContext;
    var builder = new SchemaBuilder.toSchema(context.persistentStore, 
                                             new Schema.fromDataModel(context.dataModel),
                                             isTemporary: true);
    for(var command in builder.commands)
    {
      await context.persistentStore.execute(command);
    }
  });

  tearDownAll(() async {
    await ManagedContext.defaultContext.persistentStore.close();
    await app.stop();
  });

  test("/todos returns list of todos", () async {
    var response = await client.request("/todos").get();
    expect(response, hasStatus(200));
  });
}