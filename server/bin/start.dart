import 'package:dart_todo_server/dart_todo_server.dart';

void main()
{
  var config = new TodoConfiguration("config.yaml");
  var app = new Application<TodoRequestSink>()
    ..configuration.configurationOptions = {
      TodoRequestSink.ConfigurationKey: config
    };

  app.start();
}