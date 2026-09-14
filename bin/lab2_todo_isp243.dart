import 'dart:async';

import 'package:lab2_todo_isp243/todo.dart';

import 'dart:io';

void printmenu() {
  print("");
  print("ToDo");
  print("add - добавить задачу");
  print("list - показать все задачи");
  print("done - отметить выполненной");
  print("delete - удалить задачу");
  print("exit - выйти");
}

void addTodo(List<Todo> todos) {
  stdout.write("Название задачи: ");
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print("Ошибка: название не может быть пустым");
    return;
  }

  int newid = todos.isEmpty ? 1 : todos.last.id + 1;
  todos.add(Todo(id: newid, title: input.trim()));
  print("Задача добавлена");
}

void listtodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print("список задач пуст");
    return;
  }

  print("");
  for (var todo in todos) {
    print(todo);
  }
}

void completetodo(List<Todo> todos) {
  stdout.write("введить айди задачи: ");
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print("ошибка введите число: ");
    return;
  }

  for (var todo in todos) {
    if (todo.id == id) {
      todo.complete();
      print("задача отмечена выполненной");
      return;
    }
  }

  print("Задача с id: $id не найдена!");
}

void deletetodo(List<Todo> todos) {
  stdout.write("введить айди задачи: ");
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print("ошибка введите число: ");
    return;
  }

  for (int i = 0; i < todos.length; i++) {
    if (todos[i].id == id) {
      todos.removeAt(i);
      print("задача удалена");
      return;
    }
  }

  print("Задача с id: $id не найдена!");
}

void main() {
  List<Todo> todos = [];
  printmenu();

  while(true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null) continue;
    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;
    switch (command) {
      case 'add': addTodo(todos); break;
      case 'list': listtodos(todos); break;
      case 'done': completetodo(todos); break;
      case 'delete': deletetodo(todos); break;
      case 'exit': print("До свидания!"); return;
      default: printmenu(); print("Неизвестная команда");
    }
  }
}
