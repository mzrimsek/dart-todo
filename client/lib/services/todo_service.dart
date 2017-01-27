import 'dart:async';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../dart_todo_client.dart';

@Injectable()
class TodoService
{
  static final _headers = { 'Content-Type': 'application/json' };
  static const _todosUrl = '/api/todos';

  final Client _http;

  TodoService(this._http);

  Future<List<Todo>> getTodos() async
  {
    try
    {
      final response = await _http.get(_todosUrl);
      final todos = RequestHelper.extractData(response)
        .map((value) => new Todo.fromJson(value))
        .toList();
      return todos;
    }
    catch(e)
    {
      RequestHelper.handleError(e);
    }
  }
}
