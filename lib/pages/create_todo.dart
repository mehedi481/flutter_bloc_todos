import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todos/bloc/todo_bloc.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  late TextEditingController _titleController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create a new todo"),
            // text field for the title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoBloc>().add(AddTodo(_titleController.text));
                Navigator.pop(context);
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
