import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository.dart';

class TodoUpdateViewModel extends ChangeNotifier {
  final TodoModel todo;
  final TodoRepository _repository;

  TodoUpdateViewModel({
    required this.todo,
    required TodoRepository repository,
  }) : _repository = repository;

  Future<void> updateTodoList({required TodoModel todo}) async {
    await _repository.updateTodoList(todo: todo);
    notifyListeners();
  }


}
