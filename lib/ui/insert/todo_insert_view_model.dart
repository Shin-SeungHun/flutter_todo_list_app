import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository.dart';

class TodoInsertViewModel extends ChangeNotifier{
  final TodoRepository _repository;

  // 생성자를 통해 TodoRepositoryImpl에 데이터베이스 인스턴스 전달
  TodoInsertViewModel({
    required TodoRepository repository, // 데이터베이스 인스턴스를 받아들이는 생성자 추가
  }) : _repository = repository; //

  Future<void> insertTodoList({required TodoModel todo}) async {
    await _repository.insertTodoList(todo: todo);
    notifyListeners();
  }

}