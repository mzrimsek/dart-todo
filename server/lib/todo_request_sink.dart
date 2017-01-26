import 'dart_todo_server.dart';

class TodoRequestSink extends RequestSink
{
  static String ConfigurationKey = "TodoRequestSink.Configuration";
  ManagedContext context;

  TodoRequestSink(Map<String, dynamic> options) : super(options) {
    var dataModel = new ManagedDataModel.fromCurrentMirrorSystem();

    var config = options[ConfigurationKey];
    var database = config.database;
    var persistentStore = new PostgreSQLPersistentStore.fromConnectionInfo(database.username, 
                                                                           database.password, 
                                                                           database.host, 
                                                                           database.port, 
                                                                           database.databaseName);
    context = new ManagedContext(dataModel, persistentStore);
  }

  @override
  void setupRouter(Router router)
  {
    router
      .route("/todos")
      .generate(() => new TodoController());
  }
}

class TodoConfiguration extends ConfigurationItem
{
  DatabaseConnectionConfiguration database;

  TodoConfiguration(String fileName) : super.fromFile(fileName);
}