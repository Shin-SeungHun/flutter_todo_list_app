import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository_impl.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepositoryImpl _repository = TodoRepositoryImpl();
  List<TodoModel> todoList = [];

  Future<void> add({required TodoModel todo}) async {
    await _repository.add(todo: todo);
    todoList.add(todo);
    print(todoList);

    notifyListeners();
  }

}
