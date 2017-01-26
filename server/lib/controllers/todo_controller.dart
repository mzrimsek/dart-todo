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
    return new Response.ok(todos);
  }
}
