import 'package:dart_todo/dart_todo.dart';

void main()
{
  int port = 8080;
  var config = new TodoConfiguration("config.yaml");

  var app = new Application<TodoRequestSink>()
    ..configuration.port = port
    ..configuration.configurationOptions = {
      TodoRequestSink.ConfigurationKey: config
    };

  print("server started on port " + port.toString());
  app.start();
}