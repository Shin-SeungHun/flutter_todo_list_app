import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

class TodoDb {
  late final Box<TodoModel> db;

  TodoDb({
    required this.db,
  });


  /// todo list 목록
  Future<List<TodoModel>> getTodoList() async {
    // 모든 항목을 가져와서 TodoModel로 변환한 후 리스트로 반환합니다.
    final List<TodoModel> todoList = db.values.map((e) => TodoModel.fromJson(e as Map<String, dynamic>)).toList();

    return todoList;
  }

  /// todo list 항목 id로 조회
Future<TodoModel?> getTodoListById({required int id}) async {
  final todo = db.get(id);

  return todo;
}

  /// todo list 추가
  Future<void> insertTodoList({required TodoModel todo}) async {
    await db.put(todo.id, todo);
  }

  /// todo list 업데이트
  Future<void> updateTodoList({required TodoModel todo}) async {
    if (todo.id != null) {
      await db.putAt(todo.id!, todo);
    }
  }

  /// todo list 삭제
  Future<void> deleteTodoList({required TodoModel todo}) async {
    await db.delete(todo.id);
  }

// Future<void> checkTodoList({required TodoModel todo}) async {
//   final int isDoneValue = todo.isDone ? 1 : 0;
//   await db.update(
//     'todo',
//     {'isDone': isDoneValue},
//     where: 'id = ?',
//     whereArgs: [todo.id],
//   );
//   print('Todo checked: ${todo.isDone}');
// }
}
