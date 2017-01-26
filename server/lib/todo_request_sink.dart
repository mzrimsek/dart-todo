import 'todo.dart';

class TodoRequestSink extends RequestSink
{
  TodoRequestSink(Map<String, dynamic> options) : super(options);

  @override
  void setupRouter(Router router)
  {
    router
      .route("/todos")
      .generate(() => new TodoController());
  }
}