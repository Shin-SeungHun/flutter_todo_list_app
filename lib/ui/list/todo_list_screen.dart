import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/ui/list/todo_list_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, TodoListViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            leading: const FlutterLogo(),
            title: const Text('Todo List'),
            actions: [
              IconButton(
                onPressed: () async {
                  await viewModel.getTodoList();
                },
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {
                  context.go('/insert');
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: viewModel.todoList.length,
            itemBuilder: (context, index) {
              final TodoModel todo = viewModel.todoList[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (bool? value) async {
                    setState(() {
                      todo.isDone = value ?? true;
                    });
                    await viewModel.checkTodoList(todo: todo);
                  },
                ),
                title: GestureDetector(
                  onTap: () async {
                    await context.push('/update', extra: todo);
                  },
                  child: Text(
                    todo.title.toString(),
                    style: TextStyle(
                      decoration: todo.isDone ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.grey,
                      decorationThickness: 3.0,
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        viewModel.deleteTodoList(todo: todo);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
