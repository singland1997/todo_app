import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> todos = [];

  createTodo({
    required String title,
    required String description,
  }) {
    todos.add(Todo(
      title: title,
      description: description,
    ));
    notifyListeners();
  }

  editTodo({
    required int index,
    required String newTitle,
    required String newDescription,
  }) {
    todos[index].title = newTitle;
    todos[index].description = newDescription;
    notifyListeners();
  }

  deleteTodo({required int index}) {
    todos.removeAt(index);
    notifyListeners();
  }

  changeDone({required int index, required bool isDone}) {
    todos[index].isDone = isDone;
    notifyListeners();
  }
}
