import 'package:flutter_todo_list_app/data/data_source/todo_db.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository_impl.dart';
import 'package:flutter_todo_list_app/ui/insert/todo_insert_view_model.dart';
import 'package:flutter_todo_list_app/ui/list/todo_list_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final GetIt getIt = GetIt.instance;

diSetup() async {
  final db = await _openDatabaseWithDelay();

  final todoDb = TodoDb(db: db); // 데이터베이스 인스턴스 생성
  getIt.registerSingleton<TodoRepositoryImpl>(TodoRepositoryImpl(db: todoDb)); // TodoRepositoryImpl 등록

  getIt.registerFactory<TodoListViewModel>(() => TodoListViewModel(repository: getIt<TodoRepositoryImpl>()));
  getIt.registerFactory<TodoInsertViewModel>(() => TodoInsertViewModel(repository: getIt<TodoRepositoryImpl>()));
}

Future<Database> _openDatabaseWithDelay() async {
  // 데이터베이스를 열 때 지연을 추가하여 초기화될 때까지 기다립니다.
  await Future.delayed(const Duration(seconds: 1));
  return await openDatabase(
    'todoList.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, dateTime TEXT, isDone INTEGER)');
    },
    onOpen: (db) async {
      // 데이터베이스가 열릴 때 호출되는 콜백에서 테이블이 없으면 테이블 생성
      final isTableExists = await _isTableExists(db, 'todo');
      if (!isTableExists) {
        await db.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, dateTime TEXT, isDone INTEGER)',
        );
      }
    },
  );
}

Future<bool> _isTableExists(Database db, String tableName) async {
  final result = await db.rawQuery(
    "SELECT * FROM sqlite_master WHERE type = 'table' AND name = '$tableName'",
  );
  return result.isNotEmpty;
}
