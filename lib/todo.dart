class Todo {
  int id;
  String title;
  bool isDone;
  static int _counter = 0;

  Todo({required String this.title})
    : id = ++_counter,
      isDone = false;

  @override
  String toString() {
    String status = isDone ? 'выполнено' : 'в процессе';
    String mark = isDone ? '[x]' : '[]';
    return '$mark, $id, $title ($status)';
  }

  void complete() {
    isDone = true;
  }
}
