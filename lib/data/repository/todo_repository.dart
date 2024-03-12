import 'package:flutter_todo_list_app/data/model/todo_model.dart';

abstract interface class TodoRepository {
  Future<List<TodoModel>> getTodoList();

  Future<TodoModel?> getTodoListById({required int id});

  Future<void> insertTodoList({required TodoModel todo});

  Future<void> updateTodoList({required TodoModel todo});

  Future<void> deleteTodoList({required TodoModel todo});

  Future<void> checkTodoList({required TodoModel todo});

  int uniqueTodoId();
}
