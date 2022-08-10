import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/screens.dart';

main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create_todo': (context) => CreateTodoScreen(),
        },
      ),
    );
  }
}
