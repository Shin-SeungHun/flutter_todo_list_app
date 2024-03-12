import 'dart:math';

import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:hive_flutter/adapters.dart';

class TodoDb {
  late final Box<TodoModel> db;

  TodoDb({
    required this.db,
  });

  /// todo list 목록
  Future<List<TodoModel>> getTodoList() async {
    return db.values.toList();
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
      final TodoModel getTodo = db.values.firstWhere((item) => item.id == todo.id);
      final int index = db.values.toList().indexOf(getTodo);

      getTodo
        ..id = todo.id
        ..title = todo.title
        ..dateTime = todo.dateTime
        ..isDone = todo.isDone;

      await db.putAt(index, getTodo);
    }
  }

  /// todo list 삭제
  Future<void> deleteTodoList({required TodoModel todo}) async {
    await db.delete(todo.id);
  }

  Future<void> checkTodoList({required TodoModel todo}) async {
    await db.put(todo.id, todo);
    print('Todo checked: ${todo.isDone}');
  }

  /// id 리스트를 조회하여, 가장 큰수의 +1 한 값을 id로 생성.
  int findUniqueTodoId() {
    if (db.isEmpty) {
      return 1;
    } else {
      List<int?> getIdList = db.values.map((item) => item.id).toList();
      getIdList.sort(); // ID 값을 오름차순으로 정렬
      return getIdList.last! + 1; // 마지막 ID 값에 1을 더한 값을 반환
    }
  }
}
