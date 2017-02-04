class TodoView
{
  final int id;
  String text;

  TodoView(this.id, this.text);

  factory TodoView.fromJson(Map<String, dynamic> todo) =>
    new TodoView(_toInt(todo['id']), todo['text']);

  Map toJson() => {'id': id, 'text': text};
}

int _toInt(id) => id is int ? id : int.parse(id);
