import 'package:test/test.dart';
import 'package:dart_todo_server/dart_todo_server.dart';

void main()
{
  var config = new TodoConfiguration("config.yaml.src");
  var app = new Application<TodoRequestSink>()
    ..configuration.configurationOptions = {
      TodoRequestSink.ConfigurationKey: config
    };
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

    var todos = [
      "Todo 1",
      "Todo 2"
    ];

    for(var todo in todos)
    {
      var insertQuery = new Query<Todo>()
        ..values.text = todo;
      await insertQuery.insert();
    }
  });

  tearDownAll(() async {
    await ManagedContext.defaultContext.persistentStore.close();
    await app.stop();
  });

  test("/todos returns list of todos", () async {
    var response = await client.request("/todos").get();
    expect(response, hasResponse(200, everyElement({
      "id": greaterThan(0),
      "text": isString
    })));
    expect(response.decodedBody, hasLength(greaterThan(0)));
  });
}