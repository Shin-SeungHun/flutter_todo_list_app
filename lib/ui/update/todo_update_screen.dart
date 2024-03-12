import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/ui/update/todo_update_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoUpdateScreen extends StatefulWidget {
  const TodoUpdateScreen({super.key});

  @override
  State<TodoUpdateScreen> createState() => _TodoUpdateScreenState();
}

class _TodoUpdateScreenState extends State<TodoUpdateScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final TodoUpdateViewModel viewModel = context.read<TodoUpdateViewModel>();
      _textEditingController.text = viewModel.todo.title;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoUpdateViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('update'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: '할일을 입력하세요',
              filled: true,
              fillColor: Colors.white70,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              TodoModel todo = TodoModel(
                id: viewModel.todo.id,
                title: _textEditingController.text,
                dateTime: DateTime.now(),
              );
              viewModel.updateTodoList(todo: todo);
              context.pop();
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
