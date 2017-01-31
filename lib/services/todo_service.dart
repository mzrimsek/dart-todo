import 'dart:async';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../models/todo_view.dart';
import '../helpers/web_request_helper.dart';

@Injectable()
class TodoService
{
  static final _headers = { 'Content-Type': 'application/json' };
  static const _todosUrl = '/api/todos';

  final Client _http;

  TodoService(this._http);

  Future<List<TodoView>> getTodos() async
  {
    try
    {
      final response = await _http.get(_todosUrl);
      final todos = WebRequestHelper.extractData(response)
        .map((value) => new TodoView.fromJson(value))
        .toList();
      return todos;
    }
    catch(e)
    {
      print("THREW ERROR");
      throw WebRequestHelper.handleError(e);
    }
  }
}
