import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class TodoDb {
  Database db;

  TodoDb({
    required this.db,
  });

  /// todo list 목록
  Future<List<TodoModel>> getTodoList() async {
    final maps = await db.query('todo');
    return maps.map((e) => TodoModel.fromJson(e)).toList();
  }

  /// todo list 항목 id로 조회
  Future<TodoModel?> getTodoListById({required int id}) async {
    final List<Map<String, Object?>> maps = await db.query(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps!.isNotEmpty) {
      return TodoModel.fromJson(maps.first);
    }
    return null;
  }

  /// todo list 추가
  Future<void> insertTodoList({required TodoModel todo}) async {
    await db.insert('todo', todo.toJson());
  }

  /// todo list 업데이트
  Future<void> updateTodoList({required TodoModel todo}) async {
    await db.update(
      'todo',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  /// todo list 삭제
  Future<void> deleteTodoList({required TodoModel todo}) async {
    await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> checkTodoList({required TodoModel todo}) async {
    final int isDoneValue = todo.isDone ? 1 : 0;
    await db.update(
      'todo',
      {'isDone': isDoneValue},
      where: 'id = ?',
      whereArgs: [todo.id],
    );
    print('Todo checked: ${todo.isDone}');
  }
}
