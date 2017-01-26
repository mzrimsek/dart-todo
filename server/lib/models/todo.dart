import '../dart_todo_server.dart';

class Todo extends ManagedObject<_Todo> implements _Todo {}
class _Todo
{
  @managedPrimaryKey
  int id;

  String text;
}