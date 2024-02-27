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
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TodoUpdateViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('add'),
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
                  title: _textEditingController.text,
                  dateTime: DateTime.now(),
                );
              context.push('/');
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
