import 'package:flutter_todo_list_app/data/model/todo_model.dart';

abstract interface class TodoRepository {
  Future<void> add({required TodoModel todo});
}
