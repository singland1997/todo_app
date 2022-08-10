import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos[index];
    return Card(
      child: ListTile(
        title: Text(todos.title),
        trailing: Checkbox(
          value: todos.isDone,
          onChanged: (isChange) {
            Provider.of<TodoProvider>(context, listen: false).changeDone(
              index: index,
              isDone: isChange!,
            );
          },
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              String title =
                  Provider.of<TodoProvider>(context).todos[index].title;
              String description =
                  Provider.of<TodoProvider>(context).todos[index].description;
              TextEditingController titileController =
                  TextEditingController(text: title);
              TextEditingController descriptionController =
                  TextEditingController(text: description);
              return AlertDialog(
                title: TextField(
                  controller: titileController,
                ),
                content: TextField(
                  controller: descriptionController,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<TodoProvider>(context, listen: false)
                          .editTodo(
                        index: index,
                        newTitle: titileController.text,
                        newDescription: descriptionController.text,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<TodoProvider>(context, listen: false)
                          .deleteTodo(index: index);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Delete'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
