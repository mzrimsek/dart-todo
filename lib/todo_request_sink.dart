part of dart_todo;

class TodoRequestSink extends RequestSink
{
  static String configurationKey = "TodoRequestSink.Configuration";
  ManagedContext context;

  TodoRequestSink(Map<String, dynamic> options) : super(options) {
    var dataModel = new ManagedDataModel.fromCurrentMirrorSystem();

    var config = options[configurationKey];
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
    Response.addEncoder(io.ContentType.parse("application/javascript"), (file) => UTF8.decode(file));
    Response.addEncoder(io.ContentType.parse("text/*"), (file) => UTF8.decode(file));
    Response.addEncoder(io.ContentType.parse("image/*"), (List<int> file) => new List<int>.from(file));
  }
}

class TodoConfiguration extends ConfigurationItem
{
  DatabaseConnectionConfiguration database;

  TodoConfiguration(String fileName) : super.fromFile(fileName);
}