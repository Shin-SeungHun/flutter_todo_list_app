import 'package:flutter_todo_list_app/data/data_source/todo_db.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/data/repository/todo_repository_impl.dart';
import 'package:flutter_todo_list_app/ui/insert/todo_insert_screen.dart';
import 'package:flutter_todo_list_app/ui/insert/todo_insert_view_model.dart';
import 'package:flutter_todo_list_app/ui/list/todo_list_screen.dart';
import 'package:flutter_todo_list_app/ui/list/todo_list_view_model.dart';
import 'package:flutter_todo_list_app/ui/update/todo_update_screen.dart';
import 'package:flutter_todo_list_app/ui/update/todo_update_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return ChangeNotifierProvider<TodoListViewModel>(
        create: (context) => GetIt.instance<TodoListViewModel>(),
        child: const TodoListScreen(),
      );
    },
    routes: [
      GoRoute(
        path: 'insert',
        builder: (context, state) {
          return ChangeNotifierProvider<TodoListViewModel>(
            create: (context) => GetIt.instance<TodoListViewModel>(),
            child: const TodoInsertScreen(),
          );
        },
      ),
    ],
  ),
  // GoRoute(
  //     path: '/insert',
  //     builder: (context, state) {
  //       return ChangeNotifierProvider(
  //         create: (context) => GetIt.instance<TodoInsertViewModel>(),
  //         child: const TodoInsertScreen(),
  //       );
  //     }),
  GoRoute(
      path: '/update',
      builder: (context, state) {
        final TodoModel todo = state.extra as TodoModel;
        return ChangeNotifierProvider(
          create: (context) => TodoUpdateViewModel(todo: todo, repository: GetIt.instance<TodoRepositoryImpl>()),
          child: const TodoUpdateScreen(),
        );
      }),
]);
