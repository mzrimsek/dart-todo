class Todo 
{
  final int id;
  String text;

  Todo(this.id, this.text);

  factory Todo.fromJson(Map<String, dynamic> todo) =>
    new Todo(_toInt(todo['id']), todo['text']);

  Map toJson() => {'id': id, 'name': text};
}

int _toInt(id) => id is int ? id : int.parse(id);
