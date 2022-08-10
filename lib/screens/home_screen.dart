import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/create_todo');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Todo List :',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            todoListTile(context),
          ],
        ),
      ),
    );
  }

  Widget todoListTile(BuildContext context) {
    return Column(
      children: List.generate(
          Provider.of<TodoProvider>(context).todos.length,
          (index) => TodoList(
                index: index,
              )),
    );
  }
}
