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
            leading: Checkbox(
              value: todo.isDone,
              onChanged: (bool? value) {
                viewModel.isDone(index: index);
              },
            ),
            title: Text(
              todo.title.toString(),
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
                decorationColor: Colors.grey,
                decorationThickness: 3.0,
              ),
            ),
            // subtitle: Text(todo.dateTime.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.delete(index: index);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
