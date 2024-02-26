import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository_impl.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepositoryImpl _repository = TodoRepositoryImpl();
  List<TodoModel> todoList = [];

  Future<void> add({required TodoModel todo}) async {
    todoList.add(todo);
    print(todoList);

    notifyListeners();
  }

  Future<void> isDone({required int index}) async {
    todoList[index].isDone = !todoList[index].isDone;
    notifyListeners();
  }

  Future<void> delete({required int index}) async {
    todoList.removeAt(index);
    notifyListeners();
  }

  void update({required int index, required TodoModel updatedTodo}) {
    if (index >= 0 && index < todoList.length) {
      todoList[index] = updatedTodo;
      notifyListeners(); // 상태 변경 알림
    }
  }
}
