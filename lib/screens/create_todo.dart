import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class CreateTodoScreen extends StatelessWidget {
  CreateTodoScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false).createTodo(
                title: titleController.text,
                description: descriptionController.text,
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
