import 'package:flutter_todo_list_app/data/data_source/todo_db.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDb db;

  TodoRepositoryImpl({
    required this.db,
  });

  @override
  Future<List<TodoModel>> getTodoList() async {
    return await db.getTodoList();
  }

  @override
  Future<TodoModel?> getTodoListById({required int id}) async {
    return await db.getTodoListById(id: id);
  }

  @override
  Future<void> insertTodoList({required TodoModel todo}) async {
    return await db.insertTodoList(todo: todo);
  }

  @override
  Future<void> deleteTodoList({required TodoModel todo}) async {
    return await db.deleteTodoList(todo: todo);
  }

  @override
  Future<void> updateTodoList({required TodoModel todo}) async {
    return await db.updateTodoList(todo: todo);
  }

  @override
  Future<void> checkTodoList({required TodoModel todo}) {
    // TODO: implement checkTodoList
    throw UnimplementedError();
  }

  @override
  int uniqueTodoId() {
    return db.findUniqueTodoId();
  }
}
