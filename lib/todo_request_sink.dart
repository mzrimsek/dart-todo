part of dart_todo;

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
      .route("/api/todos/[:id]")
      .generate(() => new TodoController());
    
    router
      .route("/*")
      .generate(() => new StaticFilesController());
    Response.addEncoder(io.ContentType.parse("application/javascript"), (j) => UTF8.decode(j));
    Response.addEncoder(io.ContentType.parse("text/*"), (j) => UTF8.decode(j));
    Response.addEncoder(io.ContentType.parse("image/*"), (List<int> j) => new List<int>.from(j));
  }
}

class TodoConfiguration extends ConfigurationItem
{
  DatabaseConnectionConfiguration database;

  TodoConfiguration(String fileName) : super.fromFile(fileName);
}