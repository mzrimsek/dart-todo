import '../todo.dart';
import 'dart:async';

class TodoController extends HTTPController
{
  var todos = [
    "Todo 1",
    "Todo 2"
  ];

  @httpGet
  Future<Response> getAllTodos() async
  {
    return new Response.ok(todos);
  }
}
