import 'package:flutter_todo_list_app/ui/todo_add_screen.dart';
import 'package:flutter_todo_list_app/ui/todo_list_screen.dart';
import 'package:flutter_todo_list_app/ui/todo_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => GetIt.instance<TodoViewModel>(),
          child: const TodoListScreen(),
        );
      }),
  GoRoute(
      path: '/add',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => GetIt.instance<TodoViewModel>(),
          child: const TodoAddScreen(),
        );
      }),
]);
