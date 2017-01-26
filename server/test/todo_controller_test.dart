import 'package:test/test.dart';
import 'package:dart_todo_server/todo.dart';

void main()
{
  var app = new Application<TodoRequestSink>();
  var client = new TestClient(app);

  setUpAll(() async {
    await app.start(runOnMainIsolate: true);
  });

  tearDownAll(() async {
    await app.stop();
  });

  test("/todos returns list of todos", () async {
    var response = await client.request("/todos").get();
    expect(response, hasStatus(200));
  });
}