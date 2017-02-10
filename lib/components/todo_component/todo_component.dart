import 'dart:async';

import 'package:angular2/core.dart';

import '../../services/todo_service.dart';
import '../../models/todo_view.dart';

@Component(
  selector: 'todos',
  templateUrl: 'todo_component.html',
  styleUrls: const ['todo_component.css']
)

class TodoComponent implements OnInit
{
  List<TodoView> todos;

  final TodoService _todoService;

  TodoComponent(this._todoService);

  Future<Null> ngOnInit() async
  {
    todos = await _todoService.getTodos();
  }

  Future<Null> addTodo(String text) async
  {
    if(!text.isEmpty)
    {
      var newTodo = await _todoService.addTodo(text);
      if(newTodo != null)
      {
        todos.add(newTodo);
      }
    }
  }

  Future<Null> markComplete(TodoView todo) async
  {
    var success = await _todoService.deleteTodo(todo);
    if(success)
    {
      todos.remove(todo);
    }
  }
}