import 'package:flutter_todo_list_app/data/data_source/todo_db.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository_impl.dart';
import 'package:flutter_todo_list_app/ui/insert/todo_insert_view_model.dart';
import 'package:flutter_todo_list_app/ui/list/todo_list_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt getIt = GetIt.instance;

diSetup() async {
  late Box<TodoModel> db;
  db = await Hive.openBox<TodoModel>('todoList.db');
  print('All items in todoList box:');
  for (var key in db.keys) {
    var item = db.get(key);
    print('item ${item?.isDone.runtimeType}');
    print('todoList ${db.keys};');
  }
  TodoDb todoDb = TodoDb(db: db);

  getIt.registerSingleton<TodoRepositoryImpl>(TodoRepositoryImpl(db: todoDb)); // TodoRepositoryImpl 등록

  getIt.registerFactory<TodoListViewModel>(() => TodoListViewModel(repository: getIt<TodoRepositoryImpl>()));
  getIt.registerFactory<TodoInsertViewModel>(() => TodoInsertViewModel(repository: getIt<TodoRepositoryImpl>()));
}
