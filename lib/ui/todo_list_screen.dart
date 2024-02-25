import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/ui/todo_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/add');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.todoList.length,
        itemBuilder: (context, index) {
          final todo = viewModel.todoList[index];
          return ListTile(
            title: Text(todo.title.toString()),
            subtitle: Text(todo.dateTime.toString()),
          );
        },
      ),
    );
  }
}
