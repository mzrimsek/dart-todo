import '../dart_todo_server.dart';

class TodoController extends HTTPController
{
  @httpGet
  getAllTodos() async
  {
    var todoQuery = new Query<Todo>();
    var todos = await todoQuery.fetch();
    return new Response.ok(todos);
  }

  @httpPost
  createTodo() async 
  {
    request.decodeBody();
    var requestBody = request.requestBodyObject;
    var insertQuery = new Query<Todo>()
      ..valueMap = requestBody;
    var newTodo = await insertQuery.insert();
    return new Response.ok(newTodo);
  }

  @httpPut
  updateTodo(int id, String text)
  {

  }
}
