import '../todo.dart';

class TodoController extends HTTPController
{
  var todos = [
    "Todo 1",
    "Todo 2"
  ];

  @httpGet
  getAllTodos() async
  {
    var todoQuery = new Query<Todo>();
    var todos = await todoQuery.fetch();
    return new Response.ok(todos);
  }
}
