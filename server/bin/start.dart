import 'package:dart_todo_server/dart_todo_server.dart';

void main()
{
  var app = new Application<TodoRequestSink>();

  app.start();
}