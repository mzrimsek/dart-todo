part of dart_todo;

class Todo extends ManagedObject<_Todo> implements _Todo {}
class _Todo
{
  @managedPrimaryKey
  int id;

  String text;
}