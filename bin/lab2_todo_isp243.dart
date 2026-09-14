import 'package:lab2_todo_isp243/todo.dart';

void main() {
  Todo task = Todo(id: 1, title: "купить продукты");
  Todo task2 = Todo(id: 2, title: "сделать зарядку");

  print(task);
  task.complete();
  print(task);
  print(task2);
}
