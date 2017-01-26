import 'dart_todo_server.dart';

class TodoRequestSink extends RequestSink
{
  ManagedContext context;

  TodoRequestSink(Map<String, dynamic> options) : super(options) {
    var dataModel = new ManagedDataModel([Todo]);
    var persistentStore = new PostgreSQLPersistentStore.fromConnectionInfo("dart", 
                                                                           "dart", 
                                                                           "localhost", 
                                                                           5432, 
                                                                           "dart_test");
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