import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository.dart';

class TodoListViewModel extends ChangeNotifier {
  final TodoRepository _repository;

  TodoListViewModel({
    required TodoRepository repository, // 데이터베이스 인스턴스를 받아들이는 생성자 추가
  }) : _repository = repository {
    getTodoList();
  }

  List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  Future<void> getTodoList() async {
    List<TodoModel>? todoList = await _repository.getTodoList();
    print('todoList $todoList');
    _todoList = todoList;
    notifyListeners();
  }

  Future<TodoModel?> getTodoListById({required int id}) async {
    return await _repository.getTodoListById(id: id);
  }

  Future<void> deleteTodoList({required TodoModel todo}) async {
    await _repository.deleteTodoList(todo: todo);
    _todoList.remove(todo);
    notifyListeners();
  }

  Future<void> checkTodoList({required TodoModel todo}) async {
    await _repository.checkTodoList(todo: todo);
    print(_todoList.map((e) => e.isDone));

    notifyListeners();
  }
}
