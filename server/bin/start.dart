import 'package:dart_todo_server/todo.dart';

void main()
{
  var app = new Application<TodoRequestSink>();

  app.start();
}