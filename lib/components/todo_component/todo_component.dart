import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../services/todo_service.dart';
import '../../models/todoView.dart';

@Component(
  selector: 'todos',
  templateUrl: 'todo_component.html',
  styleUrls: const ['todo_component.css']
)

class TodoComponent implements OnInit
{
  List<TodoView> todos;

  final TodoService _todoService;
  final Router _router;  

  TodoComponent(this._todoService, this._router);

  Future<Null> ngOnInit() async
  {
    todos = (await _todoService.getTodos()).toList();
  }
}