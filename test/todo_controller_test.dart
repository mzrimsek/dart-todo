import 'package:test/test.dart';
import 'package:dart_todo/dart_todo.dart';

void main()
{
  var config = new TodoConfiguration("config.yaml.src");
  var app = new Application<TodoRequestSink>()
    ..configuration.configurationOptions = {
      TodoRequestSink.configurationKey: config
    };
  var client = new TestClient(app);

  setUpAll(() async 
  {
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

  tearDownAll(() async 
  {
    await ManagedContext.defaultContext.persistentStore.close();
    await app.stop();
  });

  test("/todos returns list of todos", () async 
  {
    var response = await client.request("/api/todos").get();
    expect(response, hasResponse(200, everyElement({
      "id": greaterThan(0),
      "text": isString
    })));
    expect(response.decodedBody, hasLength(greaterThan(0)));
  });

  test("/todos returns new todo", () async 
  {
    var newText = "test todo";
    var request = client.request("/api/todos")
      ..json = {
        "text": newText
      };
    var response = await request.post();
    expect(response, hasResponse(200, {
        "id": greaterThan(0),
        "text": newText
      }));
  });

  test("/todos/id returns updated todo", () async 
  {
    var updatedText = "updated";
    var request = client.request("/api/todos/1")
      ..json = {
        "text": updatedText
      };
    var response = await request.put();
    expect(response, hasResponse(200, {
      "id": equals(1),
      "text": updatedText
    }));
  });

  test("/todos/id out of range returns 404", () async 
  {
    var request = client.request("/api/todos/5")
      ..json = {
        "text": "I wish I could update something"
      };
    var response = await request.put();
    expect(response, hasStatus(404));
  });

  test("/todos/id deletes todo", () async 
  {
    var response = await client.request("/api/todos/1").delete();
    expect(response, hasResponse(200, isNull));
  });

  test("/todos/id out of range returns 404", () async 
  {
    var response = await client.request("/api/todos/5").delete();
    expect(response, hasStatus(404));
  });
}