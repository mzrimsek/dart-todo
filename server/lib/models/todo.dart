import '../todo.dart';

class Todo extends ManagedObject<_Todo> implements _Todo {}
class _Todo
{
  @managedPrimaryKey
  int id;

  String text;
}